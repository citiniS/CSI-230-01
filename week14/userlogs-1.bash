#! /bin/bash

authfile="/var/log/auth.log"

function getLogins(){
 logline=$(cat "$authfile" | grep "systemd-logind" | grep "New session")
 dateAndUser=$(echo "$logline" | cut -d' ' -f1,2,11 | tr -d '\.')
 echo "$dateAndUser" 
}

function getFailedLogins(){
# Todo - 1
# a) Make a little research and experimentation to complete the function
# b) Generate failed logins and test
 failedlogs=$(cat "$authfile" | egrep "failed")
 datesAndUser=$(echo "$failedlogs" | cut -d' ' -f1,2,11 | tr -d '\.') 
 echo "$datesAndUser"
}

# Sending logins as email - Do not forget to change email address
# to your own email address
echo "To: yinbo.chen@mymail.champlain.edu" > emailform.txt
echo "Subject: Logins" >> emailform.txt
getLogins >> emailform.txt
cat emailform.txt | ssmtp yinbo.chen@mymail.champlain.edu

# Todo - 2
# Send failed logins as email to yourself.
# Similar to sending logins as email 
echo "To: yinbo.chen@mymail.champlain.edu" > emailform.txt
echo "Subject: Failed Logins" >> emailform.txt
getFailedLogins >> emailform.txt
cat emailform.txt | ssmtp yinbo.chen@mymail.champlain.edu 

