# possible algorithm for RANKALL
for (i in seq_along(data)) {
data2 <- lapply(data, function(x) {
                        
                        if (num == "worst") num <- rows[[names(data[i])]]
                        if (num == "best") num <- 1
                        x[num,c("hospital", "state")]
        })}