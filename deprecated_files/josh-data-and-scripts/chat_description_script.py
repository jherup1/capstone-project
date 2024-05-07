from openai import OpenAI
import json

#OpenAI API key (stored in a separate, non-committed .env file for security reasons)
client = OpenAI()

#Function to prompt chatGPT for a description of a school
def generate_description(school_name):
    prompt = f"Write a short description of {school_name} related to their graduate psychology program (if possible)."
    response = client.chat.completions.create(
        model="gpt-3.5-turbo",
        messages=[
            {"role": "user", "content": str(prompt)}
        ]
    )

    return response.choices[0].message.content

def main():
    count = 0

    #Load the JSON data
    with open("with_locations.json", "r") as file:
        data = json.load(file)

    #Iterate through each document
    for school_data in data:
        school_name = school_data["institution.displayName"]
        description = generate_description(school_name)
        school_data["institution.description"] = str(description)
        count += 1
        print(f"Entry completed for {school_name} ({count} of {len(data)})")

    #Save updated JSON data
    with open("with_description.json", "w") as file:
        json.dump(data, file, indent=4)


if __name__ == "__main__":
    main()