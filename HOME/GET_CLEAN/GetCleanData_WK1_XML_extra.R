# XML
library(XML)
#fileUrl <- "http://www.w3schools.com/xml/simple.xml"
doc <- xmlTreeParse(fileUrl,useInternal=TRUE)
rootNode <- xmlRoot(doc)
xmlName(rootNode)

rootNode[[1]]
rootNode[[1]][[1]]
rootNode[[1]][[1]][[1]]
rootNode[[1]][[2]]
rootNode[[2]][[1]]
rootNode[[2]][[1]][[1]]
rootNode[[3]][[1]]
rootNode[[3]][[2]]
rootNode[[3]][[1]][[1]]
rootNode[[4]][[1]]
rootNode[[4]][[2]]
rootNode[[4]][[1]][[1]]
#description field
rootNode[[5]][[3]]


#Using xmlSApply
xmlSApply(rootNode,xmlValue)
#XPath
#Answer to quiz1 question 4 of restaurants in zip code
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
download.file(fileUrl,destfile="./data/restaurants.xml")
doc <- xmlTreeParse("./data/restaurants.xml",useInternal=TRUE)
rootNode <- xmlRoot(doc)
xpathSApply(rootNode,"//zipcode",xmlValue)
allzipcodes <- xpathSApply(rootNode,"//zipcode",xmlValue)

# Count number of elements with "length". Could be
# multiple occurrences.
length(allzipcodes)
# Can convert to table and then use subset
restaurant_zc <- table(allzipcodes)
nrow(restaurant_zc)
#listing table and doing "nrow" should give same count
#????subset(restaurant_zc,restaurant_zc[,1] == "21231")
#table will show how many occurrences of each element if duplicated
# or convert to data frame
restaurant_df <- as.data.frame(table(allzipcodes))
nrow(restaurant_df)
#This also gives unique occurrences and how many times occurred.
subset(restaurant_df,restaurant_df[1] == "21231")
#allzipcodes Freq
#27       21231  127
#Both table and dataframe used the target "allzipcodes" as column header

xpathSApply(rootNode,"//name",xmlValue)
#
#
#
#Use fread() to read/load csv data
library("data.table")
DT <- fread("./data/getdata_data_ss06pid.csv")
# 
# The fastest way to calculate the average
# value of the variable "pwgtp15" broken down
# by sex using data.table package?
sapply(split(DT$pwgtp15,DT$SEX),mean)
#1        2 
#99.80667 96.66534
#..sapply is the fastest.

DT[,mean(pwgtp15),by=SEX]
#SEX       V1
#1:   1 99.80667
#2:   2 96.66534
tapply(DT$pwgtp15,DT$SEX,mean)
#1        2 
#99.80667 96.66534 
 
mean(DT[DT$SEX==1,]$pwgtp15); mean(DT[DT$SEX==2,]$pwgtp15)
#[1] 99.80667
#[1] 96.66534


