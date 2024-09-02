import requests
import json

from dotenv import load_dotenv
import os

load_dotenv() 

api_key = os.getenv("API_KEY")
url = "https://api.yelp.com/v3/businesses/search"

headers = {
    "Authorization": f"Bearer {api_key}",
    "accept": "application/json"
}

location = input("Enter the location (e.g., 'Los Angeles, CA'): ")

params = {
    "location": location,
    "term": "Clinic",
    "radius": 1000,
    "sort_by": "best_match",
    "limit": 20
}

response = requests.get(url, headers=headers, params=params)

if response.status_code == 200:
    data = response.json()
    for business in data['businesses']:
        name = business.get('name')
        phone = business.get('phone')
        address = ", ".join(business['location']['display_address'])
        is_open = business.get('hours', [{'is_open_now': 'N/A'}])[0].get('is_open_now', 'N/A')
        print(f"Name: {name}\nPhone: {phone}\nAddress: {address}\nOpen Now: {is_open}\n")
        print("-" * 40)
else:
    print(f"Failed to retrieve data. Status code: {response.status_code}")
    print(response.text)
