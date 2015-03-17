set.seed(13435)
X <- data.frame("var1"=sample(15),"var2"=sample(6:10),"var3"=sample(11:15))
X <- X[sample(1:5),]; X$var2[c(1,3)] = NA
X

#Can use notation such as below..find rows in X, where variable 1
# is less than or equal to 3 and variable 3 is greater than 11.
X[(X$var1 <= 3 & X$var3 > 11),]
X
#"which" command returns indices
#Sort and order
sort(X$var1)
sort(X$var1,decreasing=TRUE)
X[order(X$var1),]
X[order(X$var1,X$var3),]
#
library("plyr")
#plyr package does ordering also
#"arrange" command:
arrange(X,var1)
#Add rows and columns
#var3 is new column
X$var3 <- rnorm(5)
X
# A key process of data cleaning is finding missing, anomalies, incorrect
if(!file.exists(",/data")) {dir.create("./data")}
fileUrl <- "https://data.baltimorecity.gov/api/views/k5ry-ef3g/rows.csv?accessType=DOWNLOAD"
download.file(fileUrl,destfile="./data/restaurants.csv")
restData <- read.csv("./data/restaurants.csv")
head(restData,3)
summary(restData)
table(restData$zipCode,useNA="ifany")
colSums(is.na(restData))
#can apply "all" to dataset to show no missing values
all(colSums(is.na(restData)) == 0)
#find all zipcodes of 21212
table(restData$zipCode %in% c("21212"))
# or multiple zipcodes
table(restData$zipCode %in% c("21212","21213"))
restData[restData$zipCode %in% c("21212","21213"),]
##
# crosstabs
data(UCBAdmissions)
DF = as.data.frame(UCBAdmissions)
summary(DF)
xt <- xtabs(Freq ~ Gender + Admit, data=DF)
xt
###
#Flat tables
# can do crosstabs for larger number of variables, but often
# more difficult to see/display.

warpbreaks$replicate <- rep(1:9, len = 54)
xt = xtabs(breaks ~.,data=warpbreaks)
xt
ftable(xt)
# size
#print(object.size(DATA), units = "Mb")
print(object.size(xt), units = "Kb")
