#week 1 of exploratory data analysis
#plot based on groups of male and female
par(mfrow = c(1,1))
x <- rnorm(100)
y <- x + rnorm(100)
g <- gl(2,50)
g <- gl(2,50, labels = c("Male","Female"))
# information purposes only. Begin
str(g)
# information purposes only. End
plot(x,y)
plot(x,y, type = "n")
points(x[g == "Male"], y[g == "Male"], col = "green")
points(x[g == "Female"], y[g == "Female"], col = "blue")
points(x[g == "Female"], y[g == "Female"], col = "blue", pch = 19)
#can copy from screen to file
library(datasets)
with(faithful, plot(eruptions, waiting))
title(main = "Old Faithful Geyser data")
dev.copy(png, file = "geyserplot.png")
dev.off()
