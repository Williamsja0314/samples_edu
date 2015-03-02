#Write a function called rankhospital that takes three arguments: the 2-character
#abbreviated name of a state (state), an outcome (outcome), and the ranking of a
#hospital in that state for that outcome (num).

#rank hospitals by outcome in state




# Finding rank of hospital in a state
rankhospital <- function(state, outcome, ranking) {
        
        outcome_data <- read.csv("rprog_data3/outcome-of-care-measures.csv", colClasses = "character")
        outcome_extract <- subset(outcome_data[,1:24])
        outcome_extract[, 11] <- suppressWarnings(as.numeric(outcome_extract[, 11]))
        outcome_extract[, 17] <- suppressWarnings(as.numeric(outcome_extract[, 17]))
        outcome_extract[, 23] <- suppressWarnings(as.numeric(outcome_extract[, 23]))
        
        hospitals <- read.csv("rprog_data3/hospital-data.csv", colClasses = "character")
        allstates <- sort(unique(hospitals[,7]))
        
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

        #print("xrank is now")
        #print(xrank)
        
        if(typeof(state) != "character") {
                
                stop("invalid state")
        } else { 
                xstate <- toupper(state)
        }
        
        validState <- xstate %in% allstates
        if(!(validState)){
                stop("invalid state")
        }
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
        
  
        myhospitalset <- subset(outcome_extract,outcome_extract[,7] == xstate)
        # sort on rank and hospital name
        myselection <- subset(myhospitalset,!is.na(myhospitalset[,selectnumber]))
        #myselection <- myselection[order(myselection$Hospital.Name),]
        #myselection <- myselection[order(myselection[,selectnumber]),] 
        myselection <- myselection[order(myselection[,selectnumber], myselection[,2]),]
        mylength <- length(myselection)
        ##Get rankings
        #print("my length is now")
        #print(mylength)
        #print(xrank)


        #if(xrank > mylength){
        #      stop("invalid rank")
        #}
                
        if(xrank == "worst") {
                hospitalname <- tail(myselection[,2],1)
                #print(xrank)
        } else {
                hospitalname <- myselection[xrank,2]
                
        }

                 
        return(hospitalname)
}