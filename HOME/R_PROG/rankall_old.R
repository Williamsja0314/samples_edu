#rank hospitals by outcome in state
##outcome <- read.csv("rprog_data3/outcome-of-care-measures.csv", colClasses = "character")
ding the best hospital in a state
best <- function(outcome, num = "best" ) {
        outcome <- tolower(outcome)
        selectnumber <- 0L
        
        if(outcome == "heart attack") {
                selectnumber <- 11
        } else if(outcome == "heart failure") {
                selectnumber <- 17
        } else if(outcome == "pneumonia") {
                selectnumber <- 23
        } else {
                stop("invalid outcome")
        }
        hospitals <- read.csv("rprog_data3/hospital-data.csv", colClasses = "character")
        allstates <- sort(unique(hospitals[,7]))
        statelength <- lenght(allstates)
        statcases <- data.frame(id=rep(NA, 1), hospital=rep("", 1), stringsAsFactors=FALSE)
        for i in 1:length do {
                
        }


        
        
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
        #return(sort(besthosp))
        statcases[i, ] <- c(mod_id[i], besthosp)
        print(statcases)
        