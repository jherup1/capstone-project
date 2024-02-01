import json

with open('deprecated_files/ron-scripts/universities_worldwide_lat_long_data.json', 'r') as file:
    data = json.load(file)

for item in data:
    latitude = item.pop('latitude', None)
    longitude = item.pop('longitude', None)
    if latitude is not None and longitude is not None:
        item['myGeopoint'] = {'__lat__': latitude, '__lon__': longitude}

with open('modified_json_file.json', 'w') as file:
    json.dump(data, file, indent=4)
