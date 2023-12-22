import requests
import json
from concurrent.futures import ThreadPoolExecutor, as_completed


def find_openalex_ids(names, entity_type):
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


def fetch_psychology_publications_us(cursor, publisher_ids):
    url = "https://api.openalex.org/works"
    params = {
        'search': 'psychology OR cognitive OR neuroscience OR mental health OR social psychology',
        'filter': f'institutions.country_code:US,locations.id:({",".join(publisher_ids)})',
        'per-page': 200,
        'cursor': cursor
    }
    while True:
        response = requests.get(url, params=params)
        if response.status_code == 200:
            return response.json()
        else:
            print(f"Error fetching data: {response.status_code}")
            print("Response content:", response.text)
            return None



def fetch_all_publications_us(publisher_ids):
    initial_response = fetch_psychology_publications_us('*', publisher_ids)
    if not initial_response:
        return []

    total_records = initial_response['meta']['count']
    pages = (total_records + 199) // 200
    cursors = [initial_response['meta']['next_cursor']
               for _ in range(min(pages, 5))]
    all_publications = initial_response['results']

    with ThreadPoolExecutor(max_workers=1) as executor:
        future_to_cursor = {executor.submit(
            fetch_psychology_publications_us, cursor, publisher_ids): cursor for cursor in cursors}
        for future in as_completed(future_to_cursor):
            response = future.result()
            if response:
                all_publications.extend(response['results'])
    return all_publications


def aggregate_institutions(publications):
    institution_counts = {}
    for publication in publications:
        if 'authorships' in publication:
            for authorship in publication['authorships']:
                for institution in authorship.get('institutions', []):
                    if institution.get('country_code') == 'US':
                        inst_id = institution.get('id')
                        institution_counts[inst_id] = institution_counts.get(
                            inst_id, 0) + 1
    return institution_counts


def main():
    print("Fetching psychology publications in the US...")
    publisher_names = ["Japanese Psychological Association",
                       "British Psychological Society", "American Psychological Association", "PsychOpen"]
    publisher_ids = find_openalex_ids(publisher_names, 'venues')

    valid_publisher_ids = [id for id in publisher_ids.values() if id]

    publications = fetch_all_publications_us(valid_publisher_ids)

    print("Aggregating institutions...")
    institution_counts = aggregate_institutions(publications)

    significant_threshold = 0
    significant_institutions = {inst_id for inst_id, count in institution_counts.items(
    ) if count >= significant_threshold}

    print(f"Found {len(significant_institutions)} institutions with more than {significant_threshold} publications.")

    with open('us_psychology_universities.json', 'w') as f:
        json.dump(list(significant_institutions), f, indent=4)
    print("University data saved to us_psychology_universities.json")


if __name__ == '__main__':
    main()
