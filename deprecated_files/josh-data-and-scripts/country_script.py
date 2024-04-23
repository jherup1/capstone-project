import json
from geopy.geocoders import Nominatim

#Function to get country code using OSM
def get_country_code(lat, lng):
    geolocator = Nominatim(user_agent="institution_country_code")
    location = geolocator.reverse((lat, lng), exactly_one=True)
    return location.raw['address']['country_code']

def main():
    count = 0

    #Load the JSON data
    with open('with_description.json', 'r') as file:
        data = json.load(file)

    #Iterate through each document
    for entry in data:

        #Skip document if no location data is present
        if 'institution.mygeopoint' not in entry:
            continue
        #Get latitude and longitude
        lat = entry['institution.mygeopoint']['lat']
        lng = entry['institution.mygeopoint']['lng']
        
        #Add country code to document
        entry['institution.countryCode'] = get_country_code(lat, lng)

        #Increment count and print status
        count += 1
        print(f"Country code added for {entry['institution.displayName']} ({count} of {len(data)})")


    #Save updated JSON data
    with open('with_country.json', 'w') as file:
        json.dump(data, file, indent=4)

    print("Country codes added to each document and data saved to updated_data.json.")

if __name__ == "__main__":
    main()