# pollutantmean.R
# This script reads one or more data files in the
# desired directory and returns the mean
# of substance specified.
library(stringr)
pollutantmean <- function(directory,pollutant, id = 1:332) {
                 
        
        #print(pollutant)
        
        # note. test running stringr inside func only
       #mod_pollutant <- noquote(as.character(pollutant))
       mod_pollutant <- as.character(pollutant)
       #print(mod_pollutant)
       mod_id <- noquote(str_pad(id,3,pad = "0"))
       len_id <- length(mod_id)
       #print(mod_id[1])
       #print(len_id)
       totalsum <- as.numeric(0)
       totalrows <- 0L
       mysum <- as.numeric(0)
       myrows <- 0L
       for (i in 1:len_id) {
               #Steps:
               #construct the filename
               #open the file
               #get non-NA sum for chosen substance
               #add sum to running total
               #produce the count of good entries
               #add count to running total
               datafilename <- paste(mod_id[i],'.csv',sep="") 
               #print(mod_id[i])
               #print(datafilename)
               filestring <- (paste(directory,'/', datafilename,sep=""))
               #print(filestring)
               getdata <- read.csv(filestring, header=TRUE)
               mytable <- subset(getdata, !is.na(getdata[mod_pollutant]))
               #print(mytable)
               myrows <- nrow(mytable)
               mysum <- sum(mytable[mod_pollutant],na.rm = TRUE)
               #file_rows <- nrow(file_sum)
              # print(mysum)
               #print(myrows)
               #print(noquote(datafilename))
               totalsum <- totalsum + mysum
               #print(totalsum)
               totalrows <- totalrows + myrows
               #print(totalrows)
       }
       #Produce the mean/average
       #print(mod_pollutant)
       mean <- (totalsum / totalrows)
       #return(mean)
       return(data.frame(mytable))
        
}