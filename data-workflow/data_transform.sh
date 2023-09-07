#!/bin/bash


directory="./data-workflow/"
csv_file="${directory}airbnb_data.csv"
raw_data_directory="./data-workflow/ruwe-data/"

echo "timestamp,id,rating,price,reviewsCount,beds,bathrooms,bedrooms,isSuperhost" > "$csv_file"

# Loop through all JSON files

for json_file in "$raw_data_directory"*.json; do

    # Extract the timestamp from the JSON file name
    timestamp=$(basename "$json_file" | sed 's/airbnb-data-\(.*\)\.json/\1/')

    # Extract required data from the JSON file and append to CSV
    jq -r --arg timestamp "$timestamp" '.results[] | [$timestamp, .id, .rating, .price.rate, .reviewsCount, .beds, .bathrooms, .bedrooms, .isSuperhost	] | @csv' "$json_file" >> "$csv_file"

done

 
