#Read data from the web
#Scraping

con = url("http://scholar.google.com/citations?user=HI-I6C0AAAAJ&hl=en")
htmlCode = readLines(con)
close(con)
htmlCode

library(XML)
url <- "http://scholar.google.com/citations?user=HI-I6C0AAAAJ&hl=en"
html <- htmlTreeParse(url, useInternalNodes=T)

xpathSApply(html,"//title",xmlValue)

xpathSApply(html, "//td[@id='name']", xmlValue)

#httr package - can use to authenticate yourself to a website
library(httr);html2 <- GET(url)
pg2 = GET("http://httpbin.org/basic-auth/user/passwd",authenticate("user","passwd"))
pg2

names(pg2)
# info at http://www.r-bloggers.com/?s=Web+Scraping

#Get data from APIs.
# can use my Twitter account
library(httr);html2 <- GET(url)
myapp = oauth_app("twitter",key=" ",secret=" ")
sig = sign_oauth1.0(myapp,tokeh = " ",token_secret = " ")
homeTL = Get("https://api.twitter.com/1.1/statuses/home_timeline.json", sig)


# Info at https://dev.twitter.com/docs/api/1.1/get/search/tweets




