#Write a function called rankhospital that takes three arguments: the 2-character
#abbreviated name of a state (state), an outcome (outcome), and the ranking of a
#hospital in that state for that outcome (num).

#rank hospitals by outcome in state
outcome_data <- read.csv("rprog_data3/outcome-of-care-measures.csv", colClasses = "character")
outcome_extract <- subset(outcome_data[,1:24])
outcome_extract[, 11] <- suppressWarnings(as.numeric(outcome_extract[, 11]))
outcome_extract[, 17] <- suppressWarnings(as.numeric(outcome_extract[, 17]))
outcome_extract[, 23] <- suppressWarnings(as.numeric(outcome_extract[, 23]))



# Finding rank of hospital in a state
rankhospital <- function(state, outcome, ranking) {
        hospitals <- read.csv("rprog_data3/hospital-data.csv", colClasses = "character")
        allstates <- sort(unique(hospitals[,7]))
        
        if(typeof(ranking) == "character") {
                ranking <- tolower(ranking)
                if(ranking == "best"){
                        xrank <- 1
                } else if(tolower(ranking) == "worst") {
                        xrank <- 0
                        #print("setting xrank to worst")
                } else {
                        stop("invalid RANKING")
                }
        } else {
                
                xrank <- as.integer(ranking)
        }

        if(typeof(state) != "character") {
                
                stop("invalid STATE")
        } else { 
                xstate <- toupper(state)
        }
        
        validState <- xstate %in% allstates
        if(!(validState)){
                stop("invalid STATE")
        }
        selectnumber <- 0
        
        if(outcome == "heart attack") {
                selectnumber <- 11
        } else if(outcome == "heart failure") {
                selectnumber <- 17
        } else if(outcome == "pneumonia") {
                selectnumber <- 23
        } else {
                stop("invalid OUTCOME")
        }
        
        

        
        ## Check that state and outcome are valid
        myhospitalset <- subset(outcome_extract,outcome_extract[,7] == "NC")
        # sort on hospital name
        finalmyhospitalset <- subset(myhospitalset,!is.na(myhospitalset[,11]))
        finalmyhospitalset <- finalmyhospitalset[order(finalmyhospitalset$Hospital.Name),]
        ############# STOPPED
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