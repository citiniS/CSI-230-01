#!/bin/bash/

logFile="/home/champuser/CSI-230-01/week16/$1"

txtFile="/home/champuser/CSI-230-01/week16/$2"


iocs=()

while read -r line
do
    iocs+=("$line")
done < "$txtFile"

extracted=$(grep -E "${iocs[0]}|${iocs[1]}|${iocs[2]}|${iocs[3]}|${iocs[4]}|${iocs[5]}" "$logFile")

result=$(echo "$extracted" | cut -d " " -f1,4,7 | tr -d '[')

echo "$result" >> report.txt
