setwd("~/Documents/JHU/Course 3")

### Question 1
#download.file('https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv',
#                destfile='question1.csv')

df <- read.csv('question1.csv', header=TRUE, sep=',')

indices <- which(df$ACR==3 & df$AGS==6)
#head(indices,3)
#outputs 125, 238, 262

### Question 2
library(jpeg)
#download.file('https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg',
#              destfile='question2.jpg')

values <- readJPEG('question2.jpg', native=TRUE)
percentiles <- quantile(values,c(0.30,0.80))
#outputs -15259150, -10575416

### Question 3
library(plyr)
#download.file('https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv',
#              destfile='q3_gdp.csv')
#download.file('https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv',
#              destfile='q3_edu.csv')
gdp <- read.csv('q3_gdp.csv', header=TRUE, sep=',')
gdp <- gdp[5:194,]
edu <- read.csv('q3_edu.csv', header=TRUE, sep=',')
m <- merge(gdp, edu, by.x="X", by.y="CountryCode")
m <- subset(m,select=c("Gross.domestic.product.2012","Table.Name","Income.Group","X.3"))
m$GDP_Rank <- as.numeric(as.character(m$Gross.domestic.product.2012))
m <- arrange(m,-GDP_Rank)
print(head(m,13))
#outputs - 189 rows, 13th lowest GDP is St. Kitts and Nevis

### Question 4
aggregate(m$GDP_Rank,list(m$Income.Group),FUN=mean,na.rm=TRUE)
#outputs
#Group.1         x
#1 High income: nonOECD  91.91304
#2    High income: OECD  32.96667
#3           Low income 133.72973
#4  Lower middle income 107.70370
#5  Upper middle income  92.13333

### Question 5
top_quantile <- m[m$GDP_Rank<=38,]
length(which(top_quantile$Income.Group=="Lower middle income"))
#outputs - 5