import requests


def find_openalex_ids(names, entity_type):
    """
    Find IDs for publishers or repositories in OpenAlex based on their names.

    :param names: List of names of publishers or repositories.
    :param entity_type: Type of entity to search for, either 'publishers' or 'repositories'.
    :return: Dictionary mapping names to their OpenAlex IDs.
    """
    base_url = "https://api.openalex.org/"
    ids = {}

    for name in names:
        url = f"{base_url}{entity_type}"
        params = {'filter': f'display_name.search:"{name}"'}
        response = requests.get(url, params=params)

        if response.status_code == 200:
            data = response.json()
            results = data.get('results', [])
            if results:
                ids[name] = results[0].get('id')
            else:
                ids[name] = None
        else:
            print(f"Error fetching data for {name}: {response.status_code}")
            ids[name] = None

    return ids


publisher_names = ["The Japanese Psychological Association",
                   "British Psychological Society", "American Psychological Association", "PsychOpen"]
publisher_ids = find_openalex_ids(publisher_names, 'venues')
print(publisher_ids)
