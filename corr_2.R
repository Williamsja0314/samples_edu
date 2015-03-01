# corr.R
# This script readsdata files in the
# desired directory and returns the correlation

library(stringr)
corr <- function(directory, threshold = 0, id = 1:332) {
     
     mod_id <- noquote(str_pad(id,3,pad = "0"))
     mod_directory <- tolower(directory)
     len_id <- length(mod_id)
     #print(len_id)
     #print(mod_id)
     totalsum <- as.numeric(0)
     statcases <- data.frame(id=rep(NA, 1), nobs=rep("", 1), stringsAsFactors=FALSE)
     for (i in 1:len_id) {
          datafilename <- paste(mod_id[i],'.csv',sep="")
          #print(mod_id[i])
          #print(datafilename)
          filestring <- (paste(mod_directory,'/', datafilename,sep=""))
          #print(filestring)
          getdata <- read.csv(filestring, header=TRUE)
          casescomplete <- subset(getdata, complete.cases(getdata))
          print((nrow(casescomplete)))
          correlation <- cor(casescomplete$sulfate,casescomplete$nitrate)
          #print(correlation)
          thresholdprime <- nrow(casescomplete)
          print(thresholdprime)
          #myrows <- nrow(mytable)
          #mysumnitrate <- sum(casescomplete["nitrate"],na.rm = TRUE)
          #mysumsulfate <- sum(casescomplete["sulfate"],na.rm = TRUE)
          if (thresholdprime > threshold){
               
          }else {
               return(correlation)
               #print(head(correlation))
               #print(summary(correlation))
               #corv <- c(corv,correlation)
          }
          
         
          
     }
     #head(correlation)
     #print(statcases, row.names = FALSE)
}