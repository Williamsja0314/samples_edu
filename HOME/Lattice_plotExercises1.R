#Lattice plotting number 1
# good for many plots at once and high-density data
#Does not have separate creating and annotating.
#All done at once.
library(lattice)
library(datasets)
#Simple scatterplot
xyplot(Ozone ~ Wind, data = airquality)
airquality <- transform(airquality, Month = factor(Month))
#Note: the airquality only contains readings for months 5-900
xyplot(Ozone ~ Wind | Month, data = airquality, layout = c(5,1))
#demonstrate how lattice generates, then auto-prints
p <- xyplot(Ozone ~ Wind, data = airquality) #Nothing happens!
print(p) # #Plot appears

xyplot(Ozone ~ Temp, data = airquality) # #Auto-printing
#Demonstrate panel functions
set.seed(10)
x <- rnorm(100)
f <- rep(0:1, each = 50)
y <- x + f - f * x + rnorm(100, sd = 0.5)
f <- factor(f, labels = c("Group 1", "Group 2"))
xyplot(y ~ x | f, layout = c(2,1)) #Plot with 2 panels
#Custom panel function
xyplot(y ~ x | f, panel = function(x,y,...) {
        panel.xyplot(x,y, ...) ##first call the default panel
        panel.abline(h = median(y), lty = 2) ## add a horizontal line at median
        #panel.lmline(x,y, col =2) ##Overlay a simple linear regression line 
})

#Quiz 2 practice
library(nlme)
library(lattice)
xyplot(weight ~ Time | Diet, BodyWeight)
######
##
#I am interested in examining how the relationship between ozone
#and wind speed varies across each month. What would be the appropriate
#code to visualize that using ggplot2? 
library(ggplot2)
library(datasets)
data(airquality)
#answer 1?
qplot(Wind, Ozone, data = airquality, geom = "smooth")
#answer 2?
qplot(Wind, Ozone, data = airquality)
#answer 3?
airquality = transform(airquality, Month = factor(Month))
qplot(Wind, Ozone, data = airquality, facets = . ~ Month)
#answer 4?
#X qplot(Wind, Ozone, data = airquality, facets = . ~ factor(Month))
###
#
#This gives error because:
#ggplot does not yet know what type
#of layer to add to the plot
library(ggplot2)
g <- ggplot(movies, aes(votes, rating))
print(g)
#####
##
#The following code creates a scatterplot of 'votes'
# and 'rating' from the movies dataset in the ggplot2
#package. After loading the ggplot2 package with
# the library() function, I can run:
qplot(votes, rating, data = movies)
#How can I modify the the code above to
#add a smoother to the scatterplot?:
qplot(votes, rating, data = movies) + geom_smooth()
qplot(votes, rating, data = movies, panel = panel.loess)
#X qplot(votes, rating, data = movies) + stats_smooth("loess")
qplot(votes, rating, data = movies, panel = panel.loess)
#######
####
library(lattice)
library(datasets)
data(airquality)
p <- xyplot(Ozone ~ Wind | factor(Month), data = airquality)

