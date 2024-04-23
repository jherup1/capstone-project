import json

def main():
    #Load the JSON data
    with open('with_country.json', 'r') as file:
        data = json.load(file)

    #Initialize an empty list to store filtered data
    filtered_data = []

    count = 0

    #Iterate through each document
    for entry in data:
        #Check if 'institution.mygeopoint' field is present in the document
        if 'institution.mygeopoint' in entry:
            #If present, add the document to the filtered data
            filtered_data.append(entry)
        else:
            num_removed += 1
            print(f"Document '{entry['institution.displayName']}' removed. ({count} documents removed so far.)")


    #Save updated JSON data
    with open('new_dataset.json', 'w') as file:
        json.dump(filtered_data, file, indent=4)

if __name__ == "__main__":
    main()
