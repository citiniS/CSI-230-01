#!/bin/bash

allLogs=""
file="/var/log/apache2/access.log"

function getAllLogs(){
allLogs=$(cat "$file" | cut -d' ' -f1,4,7 | tr -d "[")
}

getAllLogs

function pageCount(){
numPages=$(echo "$allLogs" | cut -d' ' -f3 | sort -n | uniq -c)
}

pageCount 

#function countingCurlAccess(){
#results=$(cat "$file" | cut -d ' ' -f1,12 | grep "curl" | sort -n | uniq -c )
#}

#countingCurlAccess
echo "$numPages"
#echo "$results"
