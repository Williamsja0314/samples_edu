#ggplot2
library(ggplot2)
#basic function is 'qplot2'
# => qplot() data comes from data frame, always!
qplot(displ,hwy, data= mpg)
#colors for this is specified automatically
qplot(displ,hwy, data= mpg, color = drv)
#
# Adding a statistic, a "geom" with smoother
qplot(displ,hwy, data= mpg, geom = c("point","smooth"))
#Can make a histogram by specifying only one variable
qplot(hwy,data = mpg, fill = drv)
#facets  similar to panels in lattice
qplot(displ, hwy, data = mpg, facets = .~ drv)
# 3 histograms, split on "drv" drive.
# drv         : Factor w/ 3 levels "4","f","r": 2 2 2 2 2 2 2 1 1 1 ...
qplot(hwy, data = mpg, facets = drv~.,binwidth = 2)
# kids and mouse allergen study
# http://goo.gl/WqE9j8
# Examples
##histogram
#qplot(log(eno), data = maacs)
##Color separation by "yes" "no"
#qplot(log(eno), data = maacs, fill = mopos)
##Density smooth
#qplot(log(eno), data = maacs, geom = "density")
##
#qplot(log(eno), data = maacs, geom = "density", color = mopos)
##
##Scatterplots
#qplot(log(pm25),log(eno), data = maacs)
## shape on mopos => triangle or circle
#qplot(log(pm25),log(eno), data = maacs)
##color on mopos
#qplot(log(pm25),log(eno), data = maacs, color = mopos)
## Can smooth scatterplot
#qplot(log(pm25),log(eno), data = maacs, color = mopos,geom = c("point","smooth"),method = "lm")
### Use facets to split out the "no" and "yes", creating two plots
#qplot(log(pm25),log(eno), data = maacs, color = mopos,geom = c("point","smooth"),method = "lm",facets = .~ mopos)

#