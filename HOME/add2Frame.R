existingDF <- rbind(c("1","2","3","4"))
newrow = c(5:8)
for i in 1:20 {
existingDF = rbind(existingDF,c(5:8))
colnames(existingDF) <- c("1st","2nd","3rd","4th")
{
print(existingDF, row.names = FALSE)

i <- 1
DF <- data.frame(id=rep(NA, 1), nobs=rep("", 1), stringsAsFactors=FALSE)
DF[i, ] <- c(1.4, "foo")
i <- i + 1
print(DF, row.names = FALSE)