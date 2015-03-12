#plotting exercises
x <- rnorm(100)
hist(x)
y <- rnorm(100)
plot(x,y)
z <- rnorm(100)
plot(x,z)
plot(x,y)
par(mar = c(3,4,3,2))
plot(x,y)
#pch is symbols
#can search for list of all symbols
par(mar = c(4,4,3,2))
plot(x,y, pch = 10)
plot(x,y, pch = 20)
title("Scatterplot")
text(-2,-2, "Label")
legend("topleft", legend = "data")
legend("topleft",legend = "Data", pch = 20)
fit <- lm(y ~ x)
abline(fit)
abline(fit, lwd = 3)
abline(fit, lwd = 3, col = "red")
#combine into one
plot(x,y, xlab = "Weight", ylab = "Height", main = "Scatterplot", pch =20)
fit <- lm(y ~ x)
abline(fit)
#Two plots on same chart
z <- rpois(100,2) #takes range and a lambda
par(mfrow = c(2,1))
par(mar = c(4,4,2,2))
plot(x,y, pch =20)
plot(x,z, pch = 19)
#four plots on a canvas
#mfrow = rows and columns
par(mfrow = c(2,2)) #two rows and two columns
#order with be filling out rows first, since specified "mfrow"
par(mar = c(4,4,2,2))
plot(x,y, pch =20)
plot(x,z, pch =20)
plot(z,x, pch =20)
plot(y,x, pch =20)
#change to mfcol
par(mfcol = c(2,2)) #two cols and two rows
#order with be filling out cols first, since specified "mfcol"
#if want ordering by rows first:
par(mfrow = c(2,2))
#
par(mar = c(4,4,2,2))
plot(x,y, pch =20)
plot(x,z, pch =20)
plot(z,x, pch =20)
plot(y,x, pch =20)
#Using the 'points' function
#we will reset back to 1 plot
par(mfrow = c(1,1))
x <- rnorm(100)
y <- x + rnorm(100)
g <- gl(2,50)
g <- gl(2,50, labels = c("Male", "Female"))
str(g)
plot(x,y)
#So if we simply plot x and y, we cannot distinguish
# male from female.  We can plot in different colors
# we add in layers. Add male data...add female data
# Start by making plot, but don't put in data
plot(x,y, type = "n")
#plot points where on the value of the 'g' variable = 'Male'
points(x[g == "Male"], y[g == "Male"], col = "green")
points(x[g == "Female"], y[g == "Female"], col = "blue")
#if wanted solid blue circles for Female, can specify:
points(x[g == "Female"], y[g == "Female"], col = "blue", pch =19)
