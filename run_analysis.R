# Coursera Getting and Cleaning Data Assignment 

# Directions 

# You should create one R script called run_analysis.R that does the following. 
# Merges the training and the test sets to create one data set.
# Extracts only the measurements on the mean and standard deviation for each 
# measurement. 
# Uses descriptive activity names to name the activities in the data set
# Appropriately labels the data set with descriptive variable names. 
# From the data set in step 4, creates a second, independent tidy data set with 
# the average of each variable for each activity and each subject.

# Step 1: Load need packages 
library(data.table)
library(tidyr)
library(reshape)
library(dplyr)

# Step 2: Set WD and Bring in data
setwd("~/Desktop/UCI_HAR_Dataset") # Set WD
fileURL <- "http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

features <- read.table(file = "features.txt") # Bring in files
activities <- read.table(file = "activity_labels.txt",header = FALSE) # Bring in files
train <- read.table("./train/X_train.txt", header = FALSE) # Bring in files
test <- read.table("./test/X_test.txt", header = FALSE) # Bring in files

features <- tbl_df(features) # Use dplyr package to utilize data frame 
activities <- tbl_df(activities) # Use dplyr package to utilize data frame 
train <- tbl_df(train) # Use dplyr package to utilize data frame 
test <- tbl_df(test) # Use dplyr package to utilize data frame 

# Step 3: 












