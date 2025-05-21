#! /bin/bash

city=Bangkok
curl -s wttr.in/$city > raw_file
TZ=Asia/Bangkok
obs_temp=$(curl -s wttr.in/$city \
  | sed 's/\x1b\[[0-9;]*m//g' \
  | grep -m 1 '°.' \
  | grep -oE '[+]?[0-9]{2}\([0-9]{2}\)?\s')

echo "The current Temperature of $city: $obs_temp °C"

fc_temp=$(curl -s wttr.in/$city \
  | sed 's/\x1b\[[0-9;]*m//g' \
  | head -n 13 \
  | tail -n 1 \
  | cut -d "C" -f1 \
  | grep -oE '[+]?[0-9]{2}\([0-9]{2}\)?' ) 

echo "The temperature for tomorrow in the morning of $city: $fc_temp °C"

date

day=$(TZ=$TZ date "+%d")
month=$(TZ=$TZ date "+%h")
year=$(TZ=$TZ date "+%Y")

record=$(echo -e "$year\t$month\t$day\t$obs_temp\t$fc_temp °C")
echo $record >> record.log

