import asyncio
import aiohttp
import json
from geopy.geocoders import Nominatim
from concurrent.futures import ThreadPoolExecutor

# Constants
MAX_RETRIES = 3
TIMEOUT = 10  # seconds

geolocator = Nominatim(user_agent="university_locator")


async def fetch_universities_in_bbox(session, south, west, north, east, retry=0):
    if retry >= MAX_RETRIES:
        print(f"Max retries reached for bbox {south},{west},{north},{east}")
        return None


async def reverse_geocode(executor, latitude, longitude):
    def geocode():
        try:
            location = geolocator.reverse(
                (latitude, longitude), exactly_one=True)
            return location.address.split(",")[-1].strip() if location else "Unknown"
        except Exception as e:
            return "Unknown"

    return await asyncio.get_event_loop().run_in_executor(executor, geocode)


async def main():
    bounding_boxes = [(lat, lon, lat + 15, lon + 15)
                      for lat in range(-90, 90, 15) for lon in range(-180, 180, 15)]
    universities = []

    executor = ThreadPoolExecutor(max_workers=10)
    async with aiohttp.ClientSession() as session:
        for i, bbox in enumerate(bounding_boxes):
            print(
                f"Processing bounding box {i+1}/{len(bounding_boxes)}: {bbox}")
            response = None
            for attempt in range(MAX_RETRIES):
                response = await fetch_universities_in_bbox(session, *bbox)
                if response:
                    break
                print(
                    f"Retrying bbox {bbox} (attempt {attempt + 2}/{MAX_RETRIES})...")
                await asyncio.sleep(1)  # Delay before retrying

            if response:
                for element in response["elements"]:
                    if element["type"] == "way" or element["type"] == "relation":
                        if "tags" in element and "name" in element["tags"]:
                            latitude = element["center"]["lat"]
                            longitude = element["center"]["lon"]
                            country = await reverse_geocode(executor, latitude, longitude)
                            universities.append({
                                "name": element["tags"]["name"],
                                "latitude": latitude,
                                "longitude": longitude,
                                "country": country
                            })

    json_output = json.dumps(universities, indent=4)
    with open('universities_worldwide_async.json', 'w') as file:
        file.write(json_output)

    print("Finished processing universities.")
    executor.shutdown()

asyncio.run(main())
