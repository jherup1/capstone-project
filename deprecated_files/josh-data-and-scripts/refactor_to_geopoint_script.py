import json

# Open the JSON file
with open('refactored_dataset.json', 'r') as file:
    data = json.load(file)

# Iterate through each document
for document in data:
    # Check if 'geoPoint' key exists
    if 'geoPoint' in document:
        # Rename the keys within 'geoPoint'
        geo_point = document['geoPoint']
        if 'lat' in geo_point:
            geo_point['__lat__'] = geo_point.pop('lat')
        if 'lng' in geo_point:
            geo_point['__lon__'] = geo_point.pop('lng')

# Write the modified data back to the JSON file
with open('geopoint_refactored_dataset.json', 'w') as file:
    json.dump(data, file, indent=4)