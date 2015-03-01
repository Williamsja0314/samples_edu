# complete.R
# This script reads one or more data files in the
# desired directory and returns the mean
# of substance specified.
library(stringr)
complete <- function(directory, id = 1:332) {
     
       mod_id <- noquote(str_pad(id,3,pad = "0"))
       mod_directory <- tolower(directory)
       len_id <- length(mod_id)
       #print(len_id)
       #print(mod_id)
       statcases <- data.frame(id=rep(NA, 1), hospital=rep("", 1), stringsAsFactors=FALSE)
       for (i in 1:len_id) {
       datafilename <- paste(mod_id[i],'.csv',sep="")
       #print(mod_id[i])
       #print(datafilename)
       filestring <- (paste(mod_directory,'/', datafilename,sep=""))
       #print(filestring)
       getdata <- read.csv(filestring, header=TRUE)
       completes <- sum(complete.cases(getdata))
       #print(completes)
       statcases[i, ] <- c(mod_id[i], completes)
       
       }
       print(statcases)
       #print(statcases, row.names = FALSE)
}