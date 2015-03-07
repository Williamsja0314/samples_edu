#Write a function called rankhospital that takes three arguments: the 2-character
#abbreviated name of a state (state), an outcome (outcome), and the ranking of a
#hospital in that state for that outcome (num).

#rank hospitals by outcome in state
##outcome <- read.csv("rprog_data3/outcome-of-care-measures.csv", colClasses = "character")





# Finding rank of hospital in a state
rankhospital <- function(state, outcome, ranking) {
        hospitals <- read.csv("rprog_data3/hospital-data.csv", colClasses = "character")
        allstates <- sort(unique(hospitals[,7]))
        ## Read outcome data
        if(typeof(ranking) == "character") {
                ranking <- tolower(ranking)
                if(ranking == "best"){
                        xrank <- 1
                } else if(tolower(ranking) == "worst") {
                        xrank <- 0
                        #print("setting xrank to worst")
                } else {
                        stop("invalid ranking")
                }
        } else {
                xrank <- ranking
        }


                
        xstate <- "ZZ"
        state <- toupper(state)
        outcome <- tolower(outcome)
        validState <- state %in% allstates
        if(validState){
                xstate <- state
        } else {
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
        
        
        #print(selectnumber)
        outcome <- read.csv("rprog_data3/outcome-of-care-measures.csv", colClasses = "character")
        outcome[, 11] <- suppressWarnings(as.numeric(outcome[, 11]))
        outcome[, 17] <- suppressWarnings(as.numeric(outcome[, 17]))
        outcome[, 23] <- suppressWarnings(as.numeric(outcome[, 23]))
        
        ## Check that state and outcome are valid
        myhospitalset <- subset(outcome[,1:24],outcome[,7] == xstate)
        newmyhospitalset <- subset(myhospitalset,!is.na(myhospitalset[,selectnumber]))
        
        ##Get rankings
        allranks <- order(newmyhospitalset[,selectnumber])
        big <- tail(allranks,1)
        
        if(xrank == "worst") {
                xrank <- big
                #print(xrank)
        }
        validrank <- xrank %in% (order(newmyhospitalset[,selectnumber]))
        
        if(!validrank) {
                hospitalname <- "NA"
        } else {
                
                hospitalrecord <- subset(newmyhospitalset,order(newmyhospitalset[,selectnumber]) == xrank)
                hospitalname <- hospitalrecord[,2]
                #print(hospitalname[1,])
                
        }
         
        return(hospitalname)
}