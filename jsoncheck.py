import json


def count_documents_in_json(file_path):
    try:
        with open(file_path, 'r') as file:
            data = json.load(file)
            return len(data)
    except Exception as e:
        return f"An error occurred: {e}"


# Replace 'your_file.json' with the path to your JSON file
number_of_documents = count_documents_in_json('C:/Users/ronbo/capstone/capstone-project/modified_json_file.json')
print(f"Number of documents in the JSON file: {number_of_documents}")
