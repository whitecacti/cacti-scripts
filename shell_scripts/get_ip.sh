#!/bin/bash

echo "Fetching IP information..."

response=$(curl -s --max-time 5 https://ipapi.co/json/)

if [ $? -eq 0 ] && [ -n "$response" ]; then
    # Parse and display specific fields using jq
    echo "$response" | jq -r '{
        ip: .ip,
        city: .city,
        region: .region,
        region_code: .region_code,
        country_name: .country_name,
        country_code: .country_code,
        org: .org
    }'
else
    echo "Failed to retrieve IP information"
    exit 1
fi