#plot the 30-day mortality rates for heart attack
#outcome <- read.csv("rprog_data3/outcome-of-care-measures.csv", colClasses = "character")
#head(outcome)

#To make a simple histogram of the 30-day death rates from heart
#attack (column 11 in the outcome dataset)
#outcome[, 11] <- as.numeric(outcome[, 11])

## You may get a warning about NAs being introduced; that is okay.
# Because we originally read the data in as character
# (by specifying colClasses = "character" we need to coerce
# the column to be numeric. You may get a warning about NAs being
# introduced but that is okay.
 

#producing the histogram                                                     
#hist(outcome[, 11])

# Finding the best hospital in a state
best <- function(state, outcome) {
        hospitals <- read.csv("rprog_data3/hospital-data.csv", colClasses = "character")
        allstates <- sort(unique(hospitals[,7]))
       ## Read outcome data
       continueProgram = TRUE
        xstate <- "ZZ"
        state <- toupper(state)
        outcome <- tolower(outcome)
        validState <- state %in% allstates
        if(validState){
                xstate <- state
        } else {
                continueProgram = FALSE
                mycondition = "invalid state"
        }
        selectnumber <- 0L
        
        if(outcome == "heart attack") {
                selectnumber <- 11
        } else if(outcome == "heart failure") {
                selectnumber <- 17
        } else if(outcome == "pneumonia") {
                selectnumber <- 23
        } else {
                continueProgram = FALSE
                mycondition = "invalid outcome"
        }
       
       if(continueProgram) {
        #print(selectnumber)
        outcome <- read.csv("rprog_data3/outcome-of-care-measures.csv", colClasses = "character")
        outcome[, 11] <- suppressWarnings(as.numeric(outcome[, 11]))
        outcome[, 17] <- suppressWarnings(as.numeric(outcome[, 17]))
        outcome[, 23] <- suppressWarnings(as.numeric(outcome[, 23]))
        
        ## Check that state and outcome are valid
        validoutcomes <- subset(outcome[,1:24],outcome[,7] == xstate)
        newvalidoutcomes <- subset(validoutcomes,!is.na(validoutcomes[,selectnumber]))
        ## Return hospital name in that state with lowest 30-day death
        ## rate
        thebest <- numeric(0)
        thebest <- head(sort(newvalidoutcomes[,selectnumber]),1)
        #print(selectnumber)
        #print(thebest)
        
        comparebest <- ""
        comparebest <- subset(newvalidoutcomes,newvalidoutcomes[,selectnumber] == thebest)
        besthosp <- comparebest[,2]
        #print(besthosp)
        return(sort(besthosp))
       } else {
               return(mycondition)
       }  
}