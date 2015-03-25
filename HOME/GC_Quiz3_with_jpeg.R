

acsq3 <- read.csv("./data/getdata-data-ss06hid.csv", header=TRUE)
agricultureLogical <- (acsq3$ACR == 3 & acsq3$AGS == 6)
which(agricultureLogical)
#
## read in with jpeg package
library(jpeg)
file.info("getdata-jeff.jpg")
#img.n <- readJPEG(system.file("img","getdata-jeff.jpg", package="jpeg"),native=TRUE) 
img.n <- readJPEG("getdata-jeff.jpg",native=TRUE)
##
GDP <- read.csv("./data/GDP.csv")
EDU <- read.csv("./data/EDU.csv")
mergedData <- merge(GDP,EDU,by.x="X",by.y="CountryCode",all=FALSE, na.rm=TRUE)
