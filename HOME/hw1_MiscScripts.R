myhw1data = read.csv("hw1_data.csv")
ozone <- myhw1data[,1]
ozoneMissing <- is.na(ozone)
ozoneMissing
ozoneMissingNumber <- table(ozoneMissing)
ozoneMissingNumber
colMeans(myhw1data, na.rm = TRUE)
selectOzone <- subset(myhw1data, Ozone > 31 & Temp > 90)
selectOzone
colMeans(selectOzone, na.rm = TRUE)
selectMonth <- subset(myhw1data, Month == 6)
selectMonth
colMeans(selectMonth, na.rm = TRUE)
selectMay <- subset(myhw1data, Month == 5)
selectMay[order(selectMay$Ozone),]

