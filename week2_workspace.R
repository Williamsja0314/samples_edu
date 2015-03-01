# week 2 practice
f <- c("a","b","c","d","e","f","g","h","i","j")
#
for (i in 1:10) {
   print (f[i])
}
for (i in seq_along(f)) {
   print (f[i])
   
}

for (letter in f) {
   print(letter)
   
}
#if single expression only can eliminate the curly
#braces and place all on one line.
for (i in 1:10) print (f[i])

x <- matrix(1:6, 2, 3)

for (i in seq_len(nrow(x))) {
   for (j in seq_len(ncol(x))) {
      print(x[i,j])
      
   }
}
count <- 0
while (count < 10) {
   print(count)
   count <- count + 1
}

# first function
add2 <- function(g,y) {
   g + y
   
}
g <- c(1,2,6,6,6,6,6,8)
use <- g > 2
g[use]


above <- function(g,n) {
   use <- g > n
   x[use]
}

g <- 1:20
above(g,2)

# function to take a matrix or dataframe
# then calculate the mean of each column
# requires looping

#columnmean <- function(y) {
#   nc <- ncol(y)
#   means <- numeric(nc)
#   for {i in 1:nc) {
#      means[i] <- mean(y[,i])
#   }
#   means
#}

columnmean <- function(y, removeNA = TRUE) {
   nc <- ncol(y)
   means <- numeric(nc)
   for (i in 1:nc) {
      means[i] <- mean(y[,i], na.rm = removeNA)
   }
means
}

# Practice subsetting
# Getting all rows where Ozone meets criteria
subset(myhw1data, Ozone > 12)
#Getting only columns desired
subset(myhw1data, select=c("Ozone","Solar.R"))

cube <- function(x,n) {
   x^3
   
}

f <- function(x) {
        g <- function(y) {
                y + z
        }
        z <- 4
        x + g(x)
}

x <- 5
y <- if(x < 3) {
        NA
        
} else {
        10
}


existingDF <- rbind(c("1","2","3","4"))
newrow = c(5:8)
for i in 1:20 {
        existingDF = rbind(existingDF,c(5:8))
        colnames(existingDF) <- c("1st","2nd","3rd","4th")
{
                print(existingDF, row.names = FALSE)
                
                i <- 1
                DF <- data.frame(id=rep(NA, 1), nobs=rep("", 1), stringsAsFactors=FALSE)
                DF[i, ] <- c(1.4, "foo")
                i <- i + 1
                print(DF, row.names = FALSE)
                
                
                