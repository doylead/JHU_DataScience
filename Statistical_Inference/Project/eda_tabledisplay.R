library(grid)
library(gridExtra)

data(ToothGrowth)
df <- ToothGrowth

s <- aggregate(len~supp+dose,df,sd)
t <- aggregate(len~supp+dose,df,mean)
s <- s[with(s,order(supp)),]
t <- t[with(t,order(supp)),]
names(s) <- c("Supplement","Dose (mg/day)","Standard Deviation\n of Length (Unknown Units)")
names(t) <- c("Supplement","Dose (mg/day)","Mean Length (Unknown Units)")

png("mean_table.png")
grid.table(t,rows=NULL)
dev.off()

png("std_table.png")
grid.table(s,rows=NULL)
dev.off()
