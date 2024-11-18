#!/bin/bash

link="10.0.17.6/Assignment.html"

fullPage=$(curl -sL "$link")

toolOutput=$(echo "$fullPage" |
xmlstarlet format --html --recover 2>/dev/null | \
xmlstarlet select --template --copy-of \
"//html//body//table[@id='temp']//tr//td[1]")

echo "$toolOutput" | sed 's/<\/tr>/\n/g' | \
		     sed -e 's/&amp;//g' | \
		     sed -e 's/<tr>//g' | \
		     sed -e 's/<td[^>]*>//g' | \
		     sed -e 's/<\/td>/\n/g' \
		      > tables.txt

toolOutput2=$(echo "$fullPage" |
xmlstarlet format --html --recover 2>/dev/null | \
xmlstarlet select --template --copy-of \
"//html//body//table[@id='temp']//tr//td[2]")

echo "$toolOutput2" | sed 's/<\/tr>/\n/g' | \
                     sed -e 's/&amp;//g' | \
                     sed -e 's/<tr>//g' | \
                     sed -e 's/<td[^>]*>//g' | \
                     sed -e 's/<\/td>/\n/g' \
		      > dates.txt

toolOutput3=$(echo "$fullPage" |
xmlstarlet format --html --recover -n 2>/dev/null | \
xmlstarlet select --template --copy-of \
"//html//body//table[@id='press']//tr//td[1]")

echo "$toolOutput3" | sed 's/<\/tr>/\n/g' | \
                      sed -e 's/<tr>//g' | \
                      sed -e 's/<td[^>]*>//g'| \
		      sed -e 's/<\/td>/\n/g' \
                       > press.txt
echo ""
paste -d " " press.txt tables.txt dates.txt > finalthing.txt
cat finalthing.txt
