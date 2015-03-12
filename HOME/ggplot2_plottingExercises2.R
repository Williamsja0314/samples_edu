#ggplot2  cont'd
library(ggplot2)
## Example of BMI, PM2.5, Asthma, USING QPLOT
## using the cohort study to use ggplot2 to show relationships between persistent
##asthma, exacerbation in past year. Does BMI(normal vs overweight) modify the 
##relationship btwn PM2.5 and asthma symtoms?

# qplot(olgpm25, NocturnalSympt, data = maacs, facets = .~ bmicat,geom = c("point", "smooth"), method = "lm")
##DO PLOT AGAIN, using ggplot2

#g <- ggplot(maacs, aes(logpm25,NocturnalSympt))
## need layers...points, lines, etc. ??
## Can add to plot using the plus "+" symbol
# p <- g + geom_point()
#print(p)
## Will autoprint
# g + geom_point()
