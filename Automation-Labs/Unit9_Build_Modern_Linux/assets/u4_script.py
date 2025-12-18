#!/usr/bin/python3

# include the library for requests to make api calls
import requests
import json
import os
from datetime import datetime

# pull from the api usgs.gov for earthquake data for the last 24 hours
response = requests.get("https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_day.geojson")
data = response.json()  

# parse the json data to print to the screen relevant fields order by magnitude and show top 10
earthquakes = []
for feature in data['features']:
    properties = feature['properties']
    place = properties['place']
    magnitude = properties['mag']
    time = datetime.utcfromtimestamp(properties['time'] / 1000).strftime('%Y-%m-%d %H:%M:%S')
    earthquakes.append((magnitude, place, time))

    #print to the screen
earthquakes.sort(reverse=True, key=lambda x: x[0])
for eq in earthquakes[:10]:
    print(f"Magnitude: {eq[0]}, Location: {eq[1]}, Time: {eq[2]}")