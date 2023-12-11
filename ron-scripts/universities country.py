import json
import requests

# Load the existing JSON data
with open('universities_worldwide_async.json', 'r') as file:
    universities_data = json.load(file)

# Define a function for reverse geocoding
def reverse_geocode(lat, lon):
    url = f"https://nominatim.openstreetmap.org/reverse?lat={lat}&lon={lon}&format=json&accept-language=en&addressdetails=1"
    try:
        response = requests.get(url)
        if response.status_code == 200:
            data = response.json()
            return data.get("address", {}).get("country", "Unknown")
        else:
            return "Unknown"
    except Exception as e:
        return "Unknown"


# Add country information to each university
for university in universities_data:
    latitude = university["latitude"]
    longitude = university["longitude"]
    country = reverse_geocode(latitude, longitude)
    university["country"] = country

# Save the updated JSON data with country information
with open('universities_with_country.json', 'w') as file:
    json.dump(universities_data, file, indent=4)

print("Country information added to universities data.")
