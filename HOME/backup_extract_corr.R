

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
#print(completes)

}
if(matchesFound = FALSE) {
     corrArray <- vector(mode="numeric", length=0)
     return(corrArray)
} else {
     return(corrArray)
     #print(head(corrArray))
     #print(summary(corrArray))
}