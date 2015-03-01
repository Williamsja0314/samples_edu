quiz1data <- read.csv("hw1_data.csv", header=TRUE)


add2 <- function(x,y) {
    x + y
    
}
#
x <- c(4, "a", TRUE)
x <- c(1,3, 5)
y <- c(3, 2, 10)
cbind(x,y)

x <- list(2, "a", "b", TRUE)
z <- x[[2]]

x <- 1:4
y <- 2
x + y

x <- c(17, 14, 4, 5, 13, 12, 10)
x[x >= 11] <- 4

#extra. Comment out
#[1] 212.8
#> missval <- subset(quiz1data,(quiz1data[,4] == 6))
#> missval <- subset(missval,!is.na(missval[,4]))
#> mean(missval[,4])
#[1] NaN
#> missval <- subset(quiz1data,!is.na(quiz1data[,4]))
#> nextval <- subset(missval,missval[,5] == 6)
#> mean(nextval[,4])
#[1] 79.1
> missval <- subset(quiz1data,!is.na(quiz1data[,1]))
> nextval <- subset(missval,missval[,5] ==5)
> max(nextval[,1])

above10 <- function(x) {
    use <- x > 10
    x[use]
}

abovenumber <- function(x,n) {
  use <- x > n
  x[use]
}

columnmean <- function(y, start,removeNA = TRUE) {
  nc <- ncol(y) - (start - 1)
  means <- numeric(nc)
  for(i in start:nc) {
    means[i] <- mean(y[,i], na.rm = removeNA)
  }
  means
}

#create a numeric with empty and length of zero.
emptyNumeric <- vector(mode="numeric", length=0)

# writing to a data frame
justwrite <- function() {
        d <- data.frame()
        for (i in 1:20) {d <- rbind(d,c(i+i, i*i, i/1))}
        return(data.frame(d))
}

stats <- function() {
        i <- 1
        mod_i <- 2
        completes <- 10
        statcases <- data.frame()
        statcases <- rbind(statcases,c(mod_id, completes))
        colnames(statcases) <- c("col1","col2")
        #return(data.frame(statcases))
        print(statcases, row.names = FALSE)
}