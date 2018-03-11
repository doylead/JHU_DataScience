### Andrew Doyle
### JHU Course 3 Final Project

### Remove all variables from the workspace
rm(list=ls())

### Path needs to be modified on other machines
setwd('~/Documents/JHU/Course 3/Project')

### Download *.zip file, extract
### Only needs to be run once per machine
#download.file('https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip',
#                destfile = 'compressed_data.zip')

#unzip('compressed_data.zip')

### Merge training and test data sets
test_X <- read.table('UCI HAR Dataset/test/X_test.txt')
train_X <- read.table('UCI HAR Dataset/train/X_train.txt')
total_X <- rbind(test_X, train_X)

test_y <- read.table('UCI HAR Dataset/test/y_test.txt')
train_y <- read.table('UCI HAR Dataset/train/y_train.txt')
total_y <- rbind(test_y, train_y)

### Dependency for data.table added for setname
library(data.table)

### Rename features to be more descriptive based on external file
column_names <- as.character(read.table('UCI HAR Dataset/features.txt')$V2)
setnames(total_X, names(total_X), column_names)

### Subset to take only the columns corresponding to mean() and std()
interesting_columns <- c(grep('mean()', column_names),
                         grep('std()', column_names))

processed_X <- total_X[interesting_columns]

### Dependency for plyr added for join (to avoid sorting with merge) 
library(plyr)

### Rename activity codes to be more descriptive
activity_names <-read.table('UCI HAR Dataset/activity_labels.txt')
activity_mapping <- join(data.frame(total_y), activity_names)
setnames(activity_mapping, c("V1","V2"), c("index","activity"))
processed_y <- as.character(activity_mapping$activity)

### Optional - Merge processed_X and processed_y into one matrix
processed_all <- cbind(processed_X, processed_y)