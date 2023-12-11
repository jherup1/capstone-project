import json
import asyncio
import aiohttp
from geopy.geocoders import Nominatim


async def reverse_geocode(session, latitude, longitude):
    geolocator = Nominatim(user_agent="reverse_geocode")
    try:
        location = geolocator.reverse(
            (latitude, longitude), language="en", exactly_one=True)
        if location:
            address_parts = location.address.split(',')
            country = address_parts[-1].strip()
            return country
        else:
            return "Unknown"
    except Exception as e:
        print(f"Error in reverse geocoding: {e}")
        return "Unknown"


async def add_country_to_json(input_file, output_file):
    with open(input_file, 'r') as json_file:
        universities = json.load(json_file)

    async with aiohttp.ClientSession() as session:
        for university in universities:
            latitude = university["latitude"]
            longitude = university["longitude"]
            country = await reverse_geocode(session, latitude, longitude)
            university["country"] = country

    with open(output_file, 'w') as json_file:
        json.dump(universities, json_file, indent=4)

if __name__ == "__main__":
    input_file = "universities_worldwide_lat_long_data.json"
    output_file = "universities_with_country.json"

    asyncio.run(add_country_to_json(input_file, output_file))
