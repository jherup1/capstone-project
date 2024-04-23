import json
from geopy.geocoders import Nominatim

# Function to get address and coordinates using OSM
def get_address_and_coordinates(location):
    geolocator = Nominatim(user_agent="institution_geocoder")
    try:
        location_data = geolocator.geocode(location)
        if location_data:
            return {
                "address": location_data.address,
                "mygeopoint": {
                    "lat": location_data.latitude,
                    "lng": location_data.longitude
                }
            }
        else:
            return None
    except Exception as e:
        print(f"Error occurred while geocoding {location}: {str(e)}")
        return None

def main():
    #Load the JSON data
    with open("usnews_data.json", "r") as file:
        data = json.load(file)

    #Iterate through each document
    count = 0
    for document in data:

        #Get institution name, city, zip code, and state
        institution_name = document["institution.displayName"]
        city = document.get("institution.city", "")
        zip_code = document.get("institution.zip", "")
        state = document.get("institution.state", "")

        #Construct location string using institution name, city, state, and zip code
        location = f"{institution_name}, {city}, {state}, {zip_code}"

        #Get address and coordinates
        location_data = get_address_and_coordinates(location)

        if location_data:
            #Add address and coordinates to the document
            document["institution.address"] = location_data["address"]
            document["institution.mygeopoint"] = location_data["mygeopoint"]
            num_completed += 1

        print(f"Geocoded: {institution_name}  ({count} of {len(data)})")

    #Save updated JSON data
    with open("with_locations.json", "w") as file:
        json.dump(data, file, indent=4)

    print("Geocoding completed. Updated JSON file saved as output.json")

if __name__ == "__main__":
    main()