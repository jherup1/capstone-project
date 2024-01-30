import requests


def fetch_works(institution_id, concept_id):
    url = "https://api.openalex.org/works"
    params = {
        'filter': f'institutions.id:{institution_id},concepts.id:{concept_id}'
    }
    headers = {
        'User-Agent': 'YourAppName/1.0 (YourEmail@example.com)'
    }
    response = requests.get(url, headers=headers, params=params)
    if response.status_code == 200:
        return response.json()
    else:
        print(
            f"Failed to retrieve data: {response.status_code}, {response.text}")
        return None


def main():
    unr_id = 'I134113660'  # OpenAlex ID for UNR
    psychology_id = 'C15744967'  # OpenAlex ID for Psychology

    works_data = fetch_works(unr_id, psychology_id)
    if works_data:
        print(works_data)


if __name__ == "__main__":
    main()
