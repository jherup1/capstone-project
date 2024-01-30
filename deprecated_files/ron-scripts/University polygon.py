import overpy
import json


api = overpy.Overpass()

query = """
        [out:json];
        area["ISO3166-1"="US"][admin_level=2];
        (
          way["amenity"="university"](area);
          rel["amenity"="university"](area);
        );
        out body;
        >;
        out skel qt;
        """

result = api.query(query)
universities = []
for way in result.ways:
    coordinates = [[float(node.lat), float(node.lon)]
                   for node in way.nodes]
    universities.append({
        "name": way.tags.get("name", "Unnamed University"),
        "polygon": coordinates
    })
for rel in result.relations:
    for member in rel.members:
        if isinstance(member, overpy.Way) and "outer" in member.role:
            coordinates = [[float(node.lat), float(node.lon)]
                           for node in member.resolve().nodes]
            universities.append({
                "name": rel.tags.get("name", "Unnamed University"),
                "polygon": coordinates
            })

json_output = json.dumps(universities)

with open('universities.json', 'w') as file:
    file.write(json_output)
