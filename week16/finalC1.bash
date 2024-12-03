#!/bin/bash/

link="10.0.17.6/IOC.html"

fullPage=$(curl -sL "$link")

toolOutput=$(echo "$fullPage" |
xmlstarlet format --html --recover 2>/dev/null | \
xmlstarlet select --template --copy-of \
"//html//body//table//tr//td[1]")


#echo "$toolOutput"
echo "$toolOutput" | sed 's/<\/tr>/\n/g' |  \
		     sed -e 's/&amp;//g' | \
		     sed -e 's/<tr>//g' | \
		     sed -e 's/<td[^>]*>//g' | \
		     sed -e 's/<\/td>/\n/g' \
		      > IOC.txt
