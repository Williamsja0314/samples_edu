#Write a function called rankhospital that takes three arguments: the 2-character
#abbreviated name of a state (state), an outcome (outcome), and the ranking of a
#hospital in that state for that outcome (num).

#rank hospitals by outcome in state




# Finding rank of hospital in a state
rankall <- function(outcome, ranking = "best") {

        selectnumber <- 0
        if(outcome == "heart attack") {
                selectnumber <- 11
        } else if(outcome == "heart failure") {
                selectnumber <- 17
        } else if(outcome == "pneumonia") {
                selectnumber <- 23
        } else {
                stop("invalid outcome")
        }
        if(typeof(ranking) == "character") {
                ranking <- tolower(ranking)
                if(ranking == "best"){
                        xrank <- 1
                } else if(ranking == "worst") {
                        xrank <- "worst"
                        #print("setting xrank to worst")
                } else {
                        stop("invalid ranking")
                }
        } else {
                if(ranking < 1) {
                        stop("invalid ranking")
                } else {
                        xrank <- as.integer(ranking)
                }
                        
        }                
                
        
        outcome_data <- read.csv("rprog_data3/outcome-of-care-measures.csv", colClasses = "character")
        outcome_extract <- subset(outcome_data[,1:24])
        outcome_extract[, 11] <- suppressWarnings(as.numeric(outcome_extract[, 11]))
        outcome_extract[, 17] <- suppressWarnings(as.numeric(outcome_extract[, 17]))
        outcome_extract[, 23] <- suppressWarnings(as.numeric(outcome_extract[, 23]))
        
        hospitals <- read.csv("rprog_data3/hospital-data.csv", colClasses = "character")
        allstates <- sort(unique(hospitals[,7]))
        statelength <- length(allstates)
        hospstate <- data.frame(hospital=rep("", 1), state=rep("", 1), stringsAsFactors=FALSE)
        for(i in 1:statelength) { 
                xstate <- allstates[i]
                hname <- "NA"
                hstate <- "NA"
                myhospitalset <- subset(outcome_extract,outcome_extract[,7] == xstate)
                # sort on rank and hospital name
                myselection <- subset(myhospitalset,!is.na(myhospitalset[,selectnumber]))
                #myselection <- myselection[order(myselection$Hospital.Name),]
                myselection <- myselection[order(myselection[,selectnumber]),] 
                #myselection <- myselection[order(myselection[,selectnumber], myselection[,2]),]
                mylength <- length(myselection)



        if(xrank == "worst") {
                hospitalchoice <- tail(myselection)
                #print(xrank)
        } else {
                hospitalchoice <- myselection[xrank,2:7]
                
        }
        
        
        hname <- (hospitalchoice$Hospital.Name)
        #print(hname)
        hstate <- (hospitalchoice$State)
        #print(i)
        
                hospstate[i, ] <- c(hname, hstate)
                #print(hospstate)
                #print(hstate)
                #print(hospstate)

        
      
        }
        
        print(hospstate,rownames = FALSE)
}