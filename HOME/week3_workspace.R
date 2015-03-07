
x <- list(a = matrix(1:4,2,2), b = matrix(1:6, 3,2))
lapply(x, function(elt) elt[,1])

#lapply always returns a list

#sapply can make a vector
x <- list(a=1:5, b=rnorm(10))
x
# $a
# [1] 1 2 3 4 5

# $b
# [1] -1.9069004 -0.3629401 -1.4239961 -1.0780026
# [5]  0.8710390 -0.7230475 -0.9125886 -0.6754713
# [9]  0.8985911 -0.6557342

x <- list(a = 1:4, b = rnorm(10), c = rnorm(20,1),d = rnorm(100,5))
sapply(x,mean)

#Row and column functions  dissected
rowSums = apply(x, 1, sum)
rowMeans = apply(x, 1, mean)
colSums = apply(x, 2, sum)
colMeans = apply(x, 2, mean)

# Calculating the 25% and 75%
apply(x, 1, quantile, probs = c(0.25, 0.75))
apply(x, 1, quantile, probs = c(0.20, 0.80))

lapply(x, mean)
# $a
# [1] 3
# 
# $b
# [1] -0.5969051

lapply(x, mode)
# $a
# [1] "numeric"

# $b
# [1] "numeric"

lapply(x, median)
# $a
# [1] 3

# $b
# [1] -0.6992594

x <- matrix(rnorm(200), 20, 10)
#The parameter 1 is row, 2 is column.  This will collapse rows and get mean
#of columns only
apply(x, 2, mean)

#This will collapse columns and give sum of rows only
apply(x, 1, sum)


#using split
#calculate average miles per gallon by number of cylinders
#splits on major groupings (4/6/8)
library(datasets)
data(mtcars)
sapply(split(mtcars$mpg, mtcars$cyl),mean)

#shows cars in groups, grouped by cylinders
split(mtcars, mtcars$cyl)


> library(datasets)
> data(iris)
#returns vector of means of 4 major divisions
> apply(iris[, 1:4], 2, mean)
Sepal.Length  Sepal.Width Petal.Length 
5.843333     3.057333     3.758000 
Petal.Width 
1.199333

#Average miles per gallon by cylinders:
> library(datasets)
> data(mtcars)
> sapply(split(mtcars$mpg, mtcars$cyl), mean)
4        6        8 
26.66364 19.74286 15.10000

#The solve() is used to find the inverse of a matrix
#Creating a free floating variable to cache the inverse
#Followed class example with several substitutions for
# setup to return an inverse matrix, rather than mean
makeCacheMatrix <- function(x = matrix()) {
        m<-NULL
        set<-function(y){
                x<<-y
                m<<-NULL
        }
        get<-function() x
        setmatrix<-function(solve) m<<- solve
        getmatrix<-function() m
        list(set=set, get=get,
             setmatrix=setmatrix,
             getmatrix=getmatrix)
}
# The inverse matrix is derived and cached on first call,
# Then, on subsequent calls, the cache is used if there have 
# not been any changes in data. Otherwise, the inverse is
#recalculated
#
cacheSolve <- function(x=matrix(), ...) {
        m<-x$getmatrix()
        if(!is.null(m)){
                
                message("getting cached data")
                return(m)
        }
        matrix<-x$get()
        m<-solve(matrix, ...)
        x$setmatrix(m)
        m
}


