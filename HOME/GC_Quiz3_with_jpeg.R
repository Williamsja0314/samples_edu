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
GDP <- read.csv("./data/GDP.csv")
EDU <- read.csv("./data/EDU.csv")
EDU <- subset(EDU,!is.na(EDU$CountryCode))
mergedData <- merge(EDU,GDP,by.x= "CountryCode",by.y= "X",all=FALSE)
AvgOECD <- subset(GDP,GDP$Income.Group == 'High income: nonOECD')
