library(reshape2)
head(mtcars)
#
mtcars$carname <- rownames(mtcars)
#we want to create a condition and pass info as to which variables
# are ID variables, and which are "measure" variables.
carMelt <- melt(mtcars,id=c("carname","gear","cyl"), measure.vars=c("mpg","hp"))
head(carMelt,n=3)
# Creates a tall, skinny dataframe, so one row for each "mpg", or one for "hp"
tail(carMelt,n=3)
#
#different shape
cylData <- dcast(carMelt, cyl ~ variable)
cylData
cylData <- dcast(carMelt, cyl ~ variable,mean)
cylData
#Averaging values
head(InsectSprays)
#apply along an index,a function
tapply(InsectSprays$count,InsectSprays$spray,sum)
# Another method - split
spIns <- split(InsectSprays$count,InsectSprays$spray)
spIns
##
sprCount <- lapply(spIns,sum)
sprCount
#counts for each variable will be summed, in a list,
## but we may wish to go back to a vector for manipulation purposes.
##
# Breaks the summed list into a vector
unlist(sprCount)
sapply(spIns,sum)
##
#Use plyr pkg to do in one step. Use "dot" + paren around the variable name.
library(dplyr)
ddply(InsectSprays,.(spray), summarize,sum=sum(count))
##
#Example
# Find count for every variable
spraySums <- ddply(InsectSprays,.(spray),summarize,sum=ave(count,FUN=sum))
dim(spraySums) # makes same dimension as the Insectspray dataset
#will set sum for every variable in dataset, but the variable is listed the full
#number of times that it appears in the dataset
head(spraySums)
####
###
# Using dplyr  to select and change data
chicago <- readRDS("./data/chicago.rds")
dim(chicago)
str(chicago)
names(chicago)
head(select(chicago, city:dptp))
# Can select "all except"
head(select(chicago, -(city:dptp)))
# Using a filter with dplyr
# gives column with values specified
chic.f <- filter(chicago, pm25tmean2 > 30)
chic.f <- filter(chicago, pm25tmean2 > 30 & tmpd > 80)
# Order rows according to the data variable
chicago <- arrange(chicago, date)
#Can rename a column
chicago <- rename(chicago, pm25 = pm25tmean2, dewpoint = dptp)
#
# Create a new variable with 'mutate' function
# pm25 variable with mean subtracted gives new 'trend' variable
# variable ~ "deviations from the mean"
chicago <- mutate(chicago, pm25detrend = pm25 - mean(pm25, na.rm = TRUE))
###
##
# Using the group by function
#creating a variable, indicating if day is hot or cold
chicago <- mutate(chicago, tempcat = factor(1 * (tmpd > 80), labels = c("cold", "hot")))
#split on temp category variable
hotcold <- group_by(chicago, tempcat)
#can summarize
summarize(hotcold, pm25 = mean(pm25), o3 = max(o3tmeans), no2 = median(no2tmean2))
#
summarize(hotcold, pm25 = mean(pm25,na.rm = TRUE), o3 = max(o3tmeans), no2 = median(no2tmean2))
#summary for each year
chicage <- mutate(chicago, year = asPOSITlt(data)$year + 1900)
years <- group_by(chicago,year)
summarize(years, pm25 = mean(pm25,na.rm = TRUE), o3 = max(o3tmeans), no2 = median(no2tmean2))
## Special operator to allow chain operations together '%>%'  .. a pipeline operator
chicago %>% mutate(month = as.POSITlt(data)$mon + 1) %>% group_by(month) %>% summarize(pm25 = mean(pm25, na.rm = TRUE), o3 = max(o3tmean2), no2 = median(no2tmean2))
####
###
if(!file.exists("./data")) {dir.create(",/data")}
fileUrl1 = "https://dl.dropboxusercontent.com/u/7710864/data/reviews-apr29.csv"
fileUrl2 = "https://dl.dropboxusercontent.com/u/7710864/data/solutions-apr29.csv"
download.file(fileUrl1,destfile="./data/reviews.csv")
download.file(fileUrl2,destfile="./data/solutions.csv")
reviews <- read.csv("./data/reviews.csv");solutions <- read.csv("./data/solutions.csv")
head(reviews,2)
names(reviews);names(solutions)
#merging on 'id'
#default is to merge on all common column names.  Should specify!
mergedData <- merge(reviews,solutions,by.x="solution_id",by.y="id",all=TRUE)
head(mergedData)
# can use join from dplyr.  Less features.
# join is good for merging multiple data frames - df.
