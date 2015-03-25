library(XML)
library(httr)
library(httpuv)
library(dplyr)
library(stats)

if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://data.baltimorecity.gov/api/views/k5ry-ef3g/rows.csv?accessType=DOWNLOAD"
download.file(fileUrl,destfile="./data/restaurants.csv")
restData <- read.csv("./data/restaurants.csv")
restData$nearMe <- restData$neighborhood %in% c("Roland Park", "Homeland")
table(restData$nearMe)
myRests <- table(restData$nearMe)
restData$zipWrong <- ifelse(restData$zipCode < 0, TRUE, FALSE)
table(restData$zipWrong,restData$zipCode < 0)
library(Hmisc)
restData$zipGroups <- cut2(restData$zipCode,g=4) #25%
restData$zipGroups2 <- cut2(restData$zipCode,g=5) #20%
table(restData$zipGroups)
table(restData$zipGroups2)

mtcars$carname <- rownames(mtcars)
carMelt <- melt(mtcars,id=c("carname","gear","cyl"), measure.vars=c("mpg","hp","wt"))
carMelt

ddply(InsectSprays,.(spray),summarize,sum=sum(count))

