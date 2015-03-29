acsq3 <- read.csv("./data/getdata-data-ss06hid.csv", header=TRUE)
agricultureLogical <- (acsq3$ACR == 3 & acsq3$AGS == 6)
which(agricultureLogical)
#
## read in with jpeg package
library(jpeg)
file.info("getdata-jeff.jpg")
#img.n <- readJPEG(system.file("img","getdata-jeff.jpg", package="jpeg"),native=TRUE) 
img.n <- readJPEG("getdata-jeff.jpg",native=TRUE)
quantile(img.n,c(0,.30,.80,1))
##

gdp1 <- read.csv("./data/GDP1.csv")
EDU <- read.csv("./data/EDU.csv")
EDU <- subset(EDU,!is.na(EDU$CountryCode))
mergedData <- merge(EDU,GDP,by.x= "CountryCode",by.y= "X",all=FALSE)
#Quiz 4
AvgOECD <- subset(GDP,GDP$Income.Group == 'High income: nonOECD')
GDP <- read.csv("./data/getdata_data_GDP.csv")
hidsplit <- read.csv("./data/getdata_data_ss06hid.csv")
hidsplitn <- names(hidsplit)
answer <- strsplit(hidsplitn, "wgtp")
#
library(xlsx)
gdp190 <- read.xlsx("./data/grossproduct190.xls",sheetIndex=1,header=TRUE)
gdp190ans <- subset(gdp190, !is.na(gdp190[5]))
library(quantmod)
amzn = getSymbols("AMZN",auto.assign=FALSE)
sampleTimes = index(amzn) 
