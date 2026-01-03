#!/bin/bash

# pull from the api usgs.gov for earthquake data for the last 24 hours
curl -o /tmp/earthquake_data.json "https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_day.geojson"

# parse the json data to extract relevant fields using jq order by magnitude and show top 10
jq -r '.features[] | {place: .properties.place, magnitude: .properties.mag, time: .properties.time} | "\(.magnitude) - \(.place) - \(.time)"' /tmp/earthquake_data.json | sort -nr | head -n 10