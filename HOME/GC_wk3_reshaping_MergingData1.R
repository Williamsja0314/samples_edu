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
library(plyr)
ddply(InsectSprays,.(spray), summarize,sum=sum(count))
##
#Example
# Find count for every variable
spraySums <- ddply(InsectSprays,.(spray),summarize,sum=ave(count,FUN=sum))
dim(spraySums) # makes same dimension as the Insectspray dataset
#will set sum for every variable in dataset, but the variable is listed the full
#number of times that it appears in the dataset
head(spraySums)


