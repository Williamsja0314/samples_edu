justwrite <- function() {
d <- data.frame()
for (i in 1:20) {d <- rbind(d,c(i+i, i*i, i/1))}
return(data.frame(d))
}

stats <- function() {
        i <- 1
        mod_i <- 2
        completes <- 10
        statcases <- data.frame()
        statcases <- rbind(statcases,c(mod_id, completes))
        colnames(statcases) <- c("col1","col2")
        #return(data.frame(statcases))
        print(statcases, row.names = FALSE)
}