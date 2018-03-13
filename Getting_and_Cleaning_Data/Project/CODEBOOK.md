# JHU_DataScience
## Getting and Cleaning Data - Final Project
Documents associated with the final project for the class "Getting and Cleaning Data" as part of the Data Science specialization hosted on Coursera written by Johns Hopkins University

All documents (unless otherwise stated) prepared by Andrew Doyle.  
Last updated: 3/11/2018  

## Feature Description in processed_all
Each variable has three or four components, separated by underscores, _ :
  * The first represents a function, either "mean" or "std". We considered only columns of the original set that represented either an average (mean) or standard deviation (std) of measured features
  * The second represents a domain, either "Time" or "Freq". This corresponds to the domain over which the function specified 
  * The third represents the physical measurement taken
  * The fourth, if present, represents the axis along which the measurement is taken

## Feature Description in group_summaries
The data presented here is an aggregate of those in processed_all grouped by subject and activity. Each variable has four or five components, separated by underscores, _ :
  * The first argument is "summaryAverage" which describes that these quantities are averages of those in processed_all
  * The remaining arguments are described in the previous section on processed_all (after incrementing their position by one)

