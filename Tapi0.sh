#!/usr/bin/bash

> ip.txt

while :
do

while IFS= read -r line; 
do
    ip="$(grep -oP '^.[^ ]+' <<< "$line")"
    
    if [ $(grep -c $ip ip.txt) -eq 0 ]; then
    echo $ip>>ip.txt
    curl "https://ipapi.co/$ip/json/" >> api.json
    fi
    
done < /var/log/apache2/access.log

sleep 180
done
