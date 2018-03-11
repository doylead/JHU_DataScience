setwd("~/Documents/JHU/Course 3/Week 4")

### Question 1
#download.file('https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv',
#                 destfile='question1.csv')

df <- read.csv('question1.csv', header=TRUE, sep=',')

n <- names(df)
print(strsplit(n,split='wgtp')[[123]])
# Output is
# [1] ""   "15"

### Question 2
#download.file('https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv',
#                 destfile='question2.csv')

df <- read.csv('question2.csv', header=TRUE, sep=',')
df <- df[5:194,]

raw_gdp <- df$X.3
proc_gdp <- as.numeric(gsub(",","",raw_gdp))
print(mean(proc_gdp))
#Output is
# [1] 377652.4

### Question 3
# Did not require coding

### Question 4
#download.file('https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv',
#              destfile='question4.csv')

gdp <- df
edu <- read.csv('question4.csv', header=TRUE, sep=',')
m <- merge(gdp, edu, by.x="X", by.y="CountryCode")

print(length(grep('Fiscal year',grep('June',m$Special.Notes,value=TRUE),value=TRUE)))
# Outputs
# [1] 13

### Question 5
library(quantmod)
library(lubridate)
amzn = getSymbols("AMZN",auto.assign=FALSE)
sampleTimes = index(amzn)
weekdays <- wday(sampleTimes)

length(sampleTimes[year(sampleTimes)==2012])
table(wday(sampleTimes[year(sampleTimes)==2012]))
# Outputs
# [1] 250
#
#  2  3  4  5  6 
# 47 50 51 51 51