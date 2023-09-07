#!/bin/bash

directory="/home/flordebruyne/RawData/"
timestamp=$(date +%Y-%m-%d_%H-%M)
output_file="${directory}airbnb-data-${timestamp}.json"
checkin=$(date +%Y-%m-%d)
checkout="2023-08-21" #Vaste checkout date
log_file="${directory}logfile.txt"

# Check if the checkin date is not after checkout
if [[ "$checkin" > "$checkout" ]]; then
    echo "Error : the checkin date cannot be after the checkout date" >> "$log_file"
  exit 1
fi

curl -s -o "$output_file" --request GET \
  --url "https://airbnb13.p.rapidapi.com/search-location?location=Ghent&checkin=${checkin}&checkout=${checkout}&adults=1&children=0&infants=0&pets=0&page=1&currency=EUR" \
  --header "X-RapidAPI-Host: airbnb13.p.rapidapi.com" \
  --header "X-RapidAPI-Key: 351b3166d6msh9101eba09fb970fp1c0e86jsnfe840133d968" >> "$log_file" 2>&1

# Output file read-only
chmod 444 "$output_file"
