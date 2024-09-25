clear
#Q1
#$scraped_page = Invoke-WebRequest -TimeoutSec 10 http://10.0.17.33/ToBeScraped.html

#$scraped_page.links.count
#Q2
#$scraped_page.Links
#Q3
#$scraped_page.Links | Select-Object outertext, href
#Q4
#$h2s = $scraped_page.ParsedHtml.body.getElementsByTagName("h2") | select outertext

#$h2s
#Q5
#$divs1 = $scraped_page.ParsedHtml.body.getElementsByTagName("div") | Where {
#$_.getAttributeNode("class").Value -ilike "div-1"} | Select innertext

#$divs1