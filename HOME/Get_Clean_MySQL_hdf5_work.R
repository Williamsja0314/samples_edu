library("XML")
library("XLConnect")
library("DBI")
library("RMySQL")
library("data.table")
library("dataview")
                         
ucscDb <- dbConnect(MySQL(),user="genome",host="genome-mysql.cse.ucsc.edu")
result <- dbGetQuery(ucscDb,"show databases;"); dbDisconnect(ucscDb)


hg19 <- dbConnect(MySQL(),user="genome",db="hg19",host="genome-mysql.cse.ucsc.edu")
allTables <- dbListTables(hg19)
dbListFields(hg19,"affyU133Plus2")

dbGetQuery(hg19, "select count(*) from affyU133Plus2")
affyData <- dbReadTable(hg19,"affyU133Plus2")
head(affyData)
query <- dbSendQuery(hg19,"select * from affyU133Plus2 where misMatches between 3 and 5")
#need to do this to get actual contents
affyMis <- fetch(query); quantile(affyMis$misMatches)

affyMisSmall <- fetch(query,n=10); dbClearResult(query)
dim(affyMisSmall)
ncol(affyMisSmall)
dbDisconnect(hg19)

#Quiz 2
#Read HTML document line-by-line
con <- url("http://biostat.jhsph.edu/~jleek/contact.html")
acs <- readLines(con)
close(con)
acs
# a variation
url1 <- "http://biostat.jhsph.edu/~jleek/contact.html"
acsdata <- htmlTreeParse(url1, useInternalNodes=T)
xpathSApply(acsdata,"//title", xmlValue)
#
#
#
fixed_table <- read.fwf(
        file=url("http://www.cpc.ncep.noaa.gov/data/indices/wksst8110.for"),
        skip=4,
        widths=c(12, 7,4, 9,4, 9,4, 9,4))
##
# variation
#
#fixed_table <- readLines(con=url("http://www.cpc.ncep.noaa.gov/data/indices/wksst8110.for"))
# Skip 4 lines
#fixed_table <- fixed_table[-(1:4)]

#mydata <- data.frame(var1 = substr(fixed_table,1,10),
#                     var2 = substr(fixed_table, 16,19),
#                     var3 = substr(fixed_table, 20, 23),
#                     var4 = substr(fixed_table, 29, 32)  # and so on and so on
#)


# HDF5  large data sets
source("http://bioconductor.org/biocLite.R")
biocLite("rhdf5")
library(rhdf5)
created = h5createFile("example.h5")
created
created = h5createGroup("example.h5", "foo")
created = h5createGroup("example.h5", "baa")
created = h5createGroup("example.h5", "foo/foobaa")
h5ls("example.h5")
#Write to groups
A <- matrix(1:10,nr=5,nc=2)
h5write(A, "example.h5", "foo/A")
B <- array(seq(0.1,2.0,by=0.1),dim=c(5,2,2))
attr(B, "scale") <- "liter"
h5write(B, "example.h5", "foo/foobaa/B")
h5ls("example.h5")
# write a data set
df1 <- data.frame(1L:5L,seq(0,1,length.out=5),c("ab","cde","fghi","a","s"), stringsAsFactors=FALSE)
h5write(df1, "example.h5","df")
h5ls("example.h5")
H5close()
#
#Read data
#
df <- data.frame(1L:5L,seq(0,1,length.out=5),c("ab","cde","fghi","a","s"), stringsAsFactors=FALSE)
readA <- h5read("example.h5","foo/A")
readB <- h5read("example.h5","foo/foobaa/B")
readdf <- h5read("example.h5","df")
readA
H5close()
#
df <- data.frame(1L:5L,seq(0,1,length.out=5),c("ab","cde","fghi","a","s"), stringsAsFactors=FALSE)
h5write(c(12,13,14),"example.h5","foo/A",index=list(1:3,2))
h5write(c(16,17),"example.h5","foo/A",index=list(4:5,2))
#Can also do in reverse...bottom-up
h5write(c(10,11,12),"example.h5","foo/A",index=list(5:3,1))
h5read("example.h5","foo/A")
H5close()
H5garbage_collect()

