if(!file.exists("data")) {dir.create("data")}

#downloading csv file
fileUrl <- "https://data.baltimorecity.gov/api/views/dz54-2aru/rows.csv?accessType=DOWNLOAD" 
download.file(fileUrl,destfile = "./data/cameras.csv", method = "curl")
list.files("./data")
#[1] "cameras.csv"


fileUrl <- "https://data.baltimorecity.gov/api/views/dz54-2aru/rows.xlsx?accessType=DOWNLOAD"
download.file(fileUrl,destfile="./data/cameras.xlsx",method="curl")
dateDownloaded <- date()
library(xlsx)
cameraData <- read.xlsx("./data/cameras.xlsx",sheetIndex=1,header=TRUE)
head(cameraData)

library(XML)
fileUrl <- "http://www.w3schools.com/xml/simple.xml"
doc <- xmlTreeParse(fileUrl,useInternal=TRUE)
#show the highest Node
rootNode <- xmlRoot(doc)
xmlName(rootNode)
#show the 'name' labels of root node and its elements
names(rootNode)


#library(XML)
#fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
#doc <- xmlParse(fileUrl)
#rootNode <- xmlRoot(d0c)
#xmlName(rootNode)

fileUrl <- "http://espn.go.com/nfl/team/_/name/bal/baltimore-ravens"
doc <- htmlTreeParse(fileUrl,useInternal=TRUE)
scores <- xpathSApply(doc,"//li[@class='score']",xmlValue)
teams <- xpathSApply(doc,"//li[@class='team-name']",xmlValue)
scores
teams

library(jsonlite)
jsonData <- fromJSON("https://api.github.com/users/jtleek/repos")
names(jsonData)
names(jsonData$owner)
jsonData$owner$login

myjson <- toJSON(iris, pretty=TRUE)
myjson
cat(myjson)

#Using data tables
#uses same functions as data frame, but faster.
library(data.table)
DF = data.frame(x=rnorm(9),y=rep(c("a","b","c"),each=3),z=rnorm(9))
head(DF,3)

DT = data.frame(x=rnorm(9),y=rep(c("a","b","c"),each=3),z=rnorm(9))
head(DT,3)

DT2 <- DT
DT[, y:= 2]

#Multiple operations
DT[,m:= {tmp <- (x+z); log2(tmp+5)}]

set.seed(123);
DT <- data.table(x=sample(letters[1:3], 1E5, TRUE))
DT[, .N, by=x]

#data.table can be passed a list as a column parameter
DT[,list(mean(x),sum(z))]
DT[,table(y)]

#data.table can add new columns
newcolumn <- DT[,w:=z^2]
newcolumn


#subsetting based on a key
DT <- data.table(x=rep(c("a","b","c"),each=100),y=rnorm(300))
setkey(DT,x)
DT['a']
DT['b']


#Joins
DT1 <- data.table(x=c('a','a', 'b', 'dt1'), y=1:4)
DT2 <- data.table(x=c('a', 'b', 'dt2'), z=5:7)
setkey(DT1,x); setkey(DT2,x)
merge(DT1,DT2)


#add a binary variable to a table
newbinary <- DT[,a:=x>0]
newbinary

# Info for quiz 1
quiz1Url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv "
download.file(quiz1Url, destfile="./data/Idaho_surveyHousing.csv")
list.files("./data")

idahoHousing <- read.csv("data/Idaho_surveyHousing.csv", header=TRUE)

gasUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx "
download.file(gasUrl, destfile="./data/gov_NGAP.xlsx", method="curl")
list.files("./data")
library(xlsx)
dat <- read.xlsx("data/gov_NGAP.xlsx",sheetIndex=1,rowIndex = 18:23, colIndex = 7:15,header=TRUE)
mysum <- sum(dat$Zip*dat$Ext,na.rm=T) 
mysum

library(XML)
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
download.file(fileUrl,destfile = "./data/restaurants.xml", method = "curl")
xmlfile = xmlParse("data/restaurants.xml")
xmlfile = xmlTreeParse("data/restaurants.xml", )
class(xmlfile)
xml_data <- xmlToList(xmlfile)
rootNode <- xmlRoot(xmlfile)
xmlName(rootNode)
names(rootNode)
