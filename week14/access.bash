#!/bin/bash	
var1=$(date)
echo "File was accessed $var1" >> "/home/champuser/CSI-230-01/week14/fileaccesslog.txt"
var=$(cat "/home/champuser/CSI-230-01/week14/fileaccesslog.txt" | sed 's/://g')
echo "To: yinbo.chen@mymail.champlain.edu" > emailmessage.txt
echo "Subject: Access" >> emailmessage.txt
echo "$var"  >> emailmessage.txt
cat emailmessage.txt
cat emailmessage.txt | ssmtp yinbo.chen@mymail.champlain.edu
cat fileaccesslog.txt
