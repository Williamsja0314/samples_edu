# R programming from Coursera
# corr.R
# This script readsdata files in the
# desired directory and returns the correlation

library(stringr)
corr <- function(directory, threshold = 0, id = 1:332) {
     
     mod_id <- noquote(str_pad(id,3,pad = "0"))
     mod_directory <- tolower(directory)
     len_id <- length(mod_id)
     statcases <- data.frame(id=rep(NA, 1), nobs=rep("", 1), stringsAsFactors=FALSE)
     
     firstElement <- as.numeric(0)
     matchesFound <- FALSE
     #print(firstElement)
     for (i in 1:len_id) {
          datafilename <- paste(mod_id[i],'.csv',sep="")
          #print(mod_id[i])
          #print(datafilename)
          filestring <- (paste(mod_directory,'/', datafilename,sep=""))
          #print(filestring)
          getdata <- read.csv(filestring, header=TRUE)
          casescomplete <- subset(getdata, complete.cases(getdata))
          completes <- sum(complete.cases(getdata))
          #print(completes)
          #print(threshold)
          if(completes > threshold){
               matchesFound <- TRUE
               firstElement <- (firstElement + 1)
               #print(firstElement)
               if(firstElement == 1){
                    corrArray <- c(cor(casescomplete$sulfate,casescomplete$nitrate))
                    #print(corrArray)
               } else {
               newcorr <- cor(casescomplete$sulfate,casescomplete$nitrate)
               corrArray <- c(corrArray,newcorr)
               }
          }
          
     
     }
     
     if(matchesFound == FALSE) {
          corrArray <- vector(mode="numeric", length=0)
          return(corrArray)
     } else {
          return(corrArray)
          #print(head(corrArray))
          #print(summary(corrArray))
     
     }     
}
