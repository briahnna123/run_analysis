# Coursera Getting and Cleaning Data Assignment 

# Directions:

# You should create one R script called run_analysis.R that does the following. 
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each 
# measurement. 
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names. 
# 5. From the data set in step 4, creates a second, independent tidy data set with 
# the average of each variable for each activity and each subject.

# Step 1: Load need packages 
library(data.table)
library(tidyr)
library(reshape)
library(dplyr) 

# Step 2: Set WD and Bring in data
fileURL <- "http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
temp <- tempfile()
con <- unz(temp, "UCI_HAR_Dataset")
unlink(temp)
setwd("~/Desktop/UCI_HAR_Dataset") # Set WD


features <- read.table(file = "features.txt") # Bring in files
activities <- read.table(file = "activity_labels.txt",header = FALSE) # Bring in files
test_subject <- test_x <- read.table("./test/subject_test.txt", header = FALSE) # Bring in files
train_subject <- read.table("./train/subject_train.txt", header = FALSE) # Bring in files
train_x <- read.table("./train/X_train.txt", header = FALSE) # Bring in files
test_x <- read.table("./test/X_test.txt", header = FALSE) # Bring in files
train_y <- read.table("./train/y_train.txt", header = FALSE) # Bring in files
test_y <- read.table("./test/y_test.txt", header = FALSE) # Bring in files

features <- tbl_df(features) # Use dplyr package to utilize data frame 
activities <- tbl_df(activities) # Use dplyr package to utilize data frame
test_subject <- tbl_df(train_subject) # Use dplyr package to utilize data frame
train_subject <- tbl_df(train_subject) # Use dplyr package to utilize data frame 
train_x <- tbl_df(train_x) # Use dplyr package to utilize data frame 
test_x <- tbl_df(test_x) # Use dplyr package to utilize data frame 
train_y <- tbl_df(train_y) # Use dplyr package to utilize data frame 
test_y <- tbl_df(test_y) # Use dplyr package to utilize data frame 

# Step 3: Merge the data and Change Column Names
subject_train_test <- rbind(train_subject, test_subject) # Combined subject train and subject test
activity_y <- rbind(train_y, test_y) # Combined train y and test y
features_x <- rbind(train_x, test_x) # Combined train x and text x


# Step 4: Change Column Names; to ensure all have same amount of rows
colnames(subject_train_test) <- "subject"
colnames(activity_y) <- "active"
colnames(features_x ) <- t(features[2]) # Take the Second Column values of features variable
                                        # Assign it to each Column variable 


# Step 5: Combine Create Complete Data Set and then Sort
dataTable <- cbind(as.data.table(features_x, activity_y,subject_train_test ))
dataTable$activityName <- as.character(dataTable$activityName)
dataAggr<- aggregate(. ~ subject - activityName, data = dataTable, mean) 
dataTable<- tbl_df(arrange(dataAggr,subject,activityName))

# Step 6: Subset the measurements on the mean and stdev. for each measurement.
data <- grepl("mean|std", x = names(dataTable), rm.na=TRUE)

names(dataTable)<-gsub("std()", "SD", names(dataTable))
names(dataTable)<-gsub("mean()", "MEAN", names(dataTable))
names(dataTable)<-gsub("^t", "time", names(dataTable))
names(dataTable)<-gsub("^f", "frequency", names(dataTable))
names(dataTable)<-gsub("Acc", "Accelerometer", names(dataTable))
names(dataTable)<-gsub("Gyro", "Gyroscope", names(dataTable))
names(dataTable)<-gsub("Mag", "Magnitude", names(dataTable))
names(dataTable)<-gsub("BodyBody", "Body", names(dataTable))


# Step 8: Extract, SClean data and save as txt file
dataTable$subject <- as.factor(dataTable$subject)
run_analysis <- data.table(dataTable)
run_analysis<- (run_analysis1%>% group_by(subject, Activity) %>% summarise_each(funs( mean)))
write.table(x = run_analysis, file = "tidy.txt", sep= " " row.names = FALSE)







