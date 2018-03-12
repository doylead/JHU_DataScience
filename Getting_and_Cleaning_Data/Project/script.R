### Andrew Doyle
### JHU Course 3 Final Project

### Remove all variables from the workspace
rm(list=ls())

### Dependency for data.table added for setname
library(data.table)
### Dependency for plyr added for join (to avoid sorting with merge) 
library(plyr)

### Path needs to be modified on other machines
setwd('~/Dropbox/Coursera/JHU_DataScience/Getting_and_Cleaning_Data/Project')

### Download *.zip file, extract
### Only needs to be run once per machine
#download.file('https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip',
#                destfile = 'compressed_data.zip')

#unzip('compressed_data.zip')

### Merge training and test data sets
test_X <- read.table('UCI HAR Dataset/test/X_test.txt')
train_X <- read.table('UCI HAR Dataset/train/X_train.txt')
total_X <- rbind(test_X, train_X)

test_subject <- read.table('UCI HAR Dataset/test/subject_test.txt')
train_subject <- read.table('UCI HAR Dataset/train/subject_train.txt')
total_subject <- rbind(test_subject, train_subject)

test_activity <- read.table('UCI HAR Dataset/test/y_test.txt')
train_activity <- read.table('UCI HAR Dataset/train/y_train.txt')
total_activity <- rbind(test_activity, train_activity)

### Rename features to be more descriptive based on external file
column_names <- as.character(read.table('UCI HAR Dataset/features.txt')$V2)
setnames(total_X, names(total_X), column_names)

### Subset to take only the columns corresponding to mean() and std()
interesting_columns <- c(grep('mean()', column_names),
                         grep('std()', column_names))

processed_X <- total_X[interesting_columns]

### Rename activity codes to be more descriptive
activity_names <-read.table('UCI HAR Dataset/activity_labels.txt')
activity_mapping <- join(data.frame(total_activity), activity_names)
setnames(activity_mapping, c('V1','V2'), c('key','activity'))
processed_activity <- activity_mapping[,'activity',drop=FALSE]

processed_subject <- total_subject
setnames(processed_subject, "V1", "subject")

### Tidy feature names
reformat <- function(original){
  # Determines the function applied - mean or std
  func <- substring(original,
                    regexpr('-.*\\(',original)+1,
                    regexpr('\\(',original)-1)
  # Removes the function applies from the column name
  original <- gsub('-.*\\(\\)','',original)

  # Takes the first character to represent the domain
  domain_character <- substring(original,1,1)
  domain <- if(domain_character=='t'){'Time'}else{'Freq'}
  # Removes the domain character from the column name
  original <- substring(original,2)
  
  # Remove hyphens before direction data where it exists
  original <- gsub('-','',original)

  # Corrects for "Body" being written twice in some cases
  original <- gsub('BodyBody','Body',original)
    
  # Combine to tidy column names
  new <- as.character(paste(func,domain,original,sep=''))
  
  # Return the results
  return(new)
}

### Call the reformat() method we just defined to change column names
setnames(processed_X,
         names(processed_X),
         sapply(names(processed_X), reformat))

### Merge processed_X processed_subject and processed_activity into one matrix
processed_all <- cbind(processed_X, processed_subject, processed_activity)