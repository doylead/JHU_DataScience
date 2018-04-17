setwd('~/Dropbox/Coursera/JHU_DataScience/Statistical_Inference/Project')

library(grid)
library(gridExtra)

tt <- ttheme_minimal(
  core=list(bg_params = list(fill = blues9[2:4], col=NA),
  fg_params=list(fontface=3)),
  colhead=list(fg_params=list(col="navyblue", fontface=4L), bg_params=list(col=blues9[1])))

data(ToothGrowth)
df <- ToothGrowth

df.c <- aggregate(len~supp+dose,df,length)
df.m <- aggregate(len~supp+dose,df,mean)
df.s <- aggregate(len~supp+dose,df,sd)

df.cm <- merge(df.c,df.m,by=c("supp","dose"))
df <- merge(df.cm,df.s,by=c("supp","dose"))

names(df) <- c("Supplement","Dose\n (mg/day)","Sample\n Size","Mean Length\n (Unknown Units)","Standard Deviation\n of Length\n (Unknown Units)")

df <- df[with(df,order(Supplement)),]
df$`Standard Deviation
 of Length
 (Unknown Units)` <- round(df$`Standard Deviation
 of Length
 (Unknown Units)`,2)

grid.table(df,rows=NULL,theme=tt)
# Export at 590,250