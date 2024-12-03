#!/bin/bash/

dir="/var/www/html/"
txtFile="/home/champuser/CSI-230-01/week16/report.txt"
:> report.html

echo "<html>" >> report.html
echo "<style>" >> report.html
echo "td { border: 1px solid black;}" >> report.html
echo "</style>" >> report.html
echo "<body>" >> report.html
echo "<p>Access logs with IOC indicators:</p>" >> report.html
echo "<table>" >> report.html
echo "<tr>" >> report.html
while read -r line;
do
   echo "<tr>" >> report.html
   var1=$(echo "$line" | awk '{print $1}')
   var2=$(echo "$line" | awk '{print $2}')
   var3=$(echo "$line" | awk '{print $3}')
   echo "<td>$var1</td>" >> report.html
   echo "<td>$var2</td>" >> report.html
   echo "<td>$var3</td>" >> report.html
   echo "</tr>" >> report.html
done < "$txtFile"

echo "</tr>" >> report.html
echo "</table>" >> report.html
echo "</body>" >> report.html
echo "</html>" >> report.html


mv report.html "$dir"
