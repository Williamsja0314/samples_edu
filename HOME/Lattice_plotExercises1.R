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


