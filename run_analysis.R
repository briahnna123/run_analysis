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
library(dplyr) 

# Step 2: Set WD and Bring in data
setwd("~/Desktop")
fileURL <- "http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileURL, destfile = "dataset.zip") # Downloads the file
unzip("dataset.zip") # Unizips file in WD

# Step 3: Bring in tables Seperately
test_set <- read.table("./UCI HAR Dataset/test/X_test.txt", header=FALSE) # Testing 
test_set_act <- read.table("./UCI HAR Dataset/test/y_test.txt", header=FALSE) # Activities for Testing
test_sub <- read.table("./UCI HAR Dataset/test/subject_test.txt", header=FALSE) # Info about Subjects
train_set <- read.table("./UCI HAR Dataset/train/X_train.txt", header=FALSE) # Traning
train_set_act <- read.table("./UCI HAR Dataset/train/y_train.txt", header=FALSE) # Activities for Traning
train_sub <- read.table("./UCI HAR Dataset/train/subject_train.txt", header=FALSE) # Info about Subjects

# Step 4: Read in Activities and
# Use Descriptive Names to refer to the activities in the Activities Table
activities <- read.table("./UCI HAR Dataset/activity_labels.txt", 
                         header=FALSE, colClasses="character") # Meta data on different activities

# Both "test_set_act" and "train_set_act" have one Column, which represent 
# Activities for Testing and Activities for Traning
test_set_act$V1 <- factor(test_set_act$V1, levels=activities$V1, labels=activities$V2) 
# Above Label the Testing Activity by descriptive name instead of number value

train_set_act$V1 <- factor(train_set_act$V1, levels=activities$V1, labels=activities$V2)  
# Above Label the Traning Activity by descriptive name instead of number value

# Step 5: Give Column Descriptive Activity Names for Features
# Note: features table has Two Columns, where V2 is the Statistics Summary Features
features <- read.table("./UCI HAR Dataset/features.txt", 
                       header=FALSE, colClasses="character") 
# Above Statistics Summary Features of the Activity Variables

colnames(test_set)<- features$V2 # Testing Features; Should have same amount of Variables as Traning 
colnames(train_set)<- features$V2 # Traning Features; Should have same amount of Variables as Testing
colnames(test_set_act)<- c("Activity") # Activities for Testing; Changing Column Name
colnames(train_set_act)<- c("Activity") # Activities for Traning; Changing Column Name
colnames(test_sub)<- c("Subject") # Subject Observations should Match the number
                                  # of Testing Activities; Changing Column Name
colnames(train_sub)<- c("Subject") # Subject Observations should Match the number
                                   # of Traning Activities; Changing Column Name

# Step 6: Combine Testing and Training sets, with their Respective Activities & Subjects
test_set<-cbind(test_set, test_set_act) # Mix Testing with Testing Activities
test_set<-cbind(test_set, test_sub) # Mix Testing, Activities, and Subjects
train_set<-cbind(train_set, train_set_act) # Mix Traning with Traning Activities
train_set<-cbind(train_set, train_sub) # Mix Traning Activities and Subjects
all<-rbind(test_set, train_set) # Mix of Complete Testing and Traning

# Step 7: Subset the data to extract the measurements on the mean and stdev for 
# each measurement
all_mean<-sapply(all, mean, na.rm=TRUE) # Subset Numeric Vector full of Mean Values
all_stdev<-sapply(all, sd, na.rm=TRUE) # Subset Numeric Vector full of stdev Values

# Step 8: Labels the Data Set with descriptive Variable names
# Change Short Descriptive Names to Long More Descriptive Names
# Use the gsub() function to Find and Replace the Word(s) of Interest
names(all)<-gsub("Acc", "Accelerometer", names(all))
names(all)<-gsub("Gyro", "Gyroscope", names(all))
names(all)<-gsub("BodyBody", "Body", names(all))
names(all)<-gsub("Mag", "Magnitude", names(all))
names(all)<-gsub("^t", "Time", names(all))
names(all)<-gsub("^f", "Frequency", names(all))
names(all)<-gsub("tBody", "TimeBody", names(all))
names(all)<-gsub("-mean()", "Mean", names(all), ignore.case = TRUE)
names(all)<-gsub("-std()", "STD", names(all), ignore.case = TRUE)
names(all)<-gsub("-freq()", "Frequency", names(all), ignore.case = TRUE)
names(all)<-gsub("angle", "Angle", names(all))
names(all)<-gsub("gravity", "Gravity", names(all))

# Step 9: Convert Numeric Vectors back into Data Table and Create Clean data
# where the average of each Variable(Testing/Traning) for each 
# Activity(STANDING/SITTING/LAYING etc. ) and each Subject(30 Subjects Grouped 1:10).
data <- data.table(all)
tidy_data<- data[ , lapply(.SD, mean), by="Activity,Subject"] # Note: Do not leave Space between Groups
# Above use lapply() to apply .SD and Mean to Subsets of interest
setwd("~/Desktop") # Set WD to see text file outside raw data folder
write.table(tidy_data, file="tidy.txt", sep=",", row.names = FALSE)




