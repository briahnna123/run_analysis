# Run Analysis Assignment
# Coursera Getting and Cleaning Data Assignment  <br />
**The Following Directions were taking from the Johns Hopkins Coursera Data Sciene Specialization verbatim
***Important Note: My explination of how all of the scripts work and how they are connected starts on Line 48.  <br />

# Introduction

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.  <br /> (Coursera, Johns Hopkins, Jeff Leek)

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 
<br /> (Coursera, Johns Hopkins, Jeff Leek)

## Assignment

You should create one R script called run_analysis.R that does the following. 
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
<br /> (Coursera, Johns Hopkins, Jeff Leek)


## Background about Raw Data:

Data Set Information:

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. <br /> 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.<br /> 

Check the README.txt file for further details about this dataset.**Note this text is not included go to the Coursera Website for Offical README.txt <br /> 

A video of the experiment including an example of the 6 recorded activities with one of the participants can be seen in the following link: [Web Link] **Note this Video is not included go to the Coursera Website
for the Offical Link <br /> 


Attribute Information:

For each record in the dataset it is provided: 
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. 
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment. <br /> 
[UCI Citation](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

# My Data Analysis Data Breakdown: <br />

# Explination of raw data files: <br />

1. activity_labels.txt: Links the class labels with their activity name.  <br />
Activities include: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING.  <br />

2. features_info.txt: Shows information about the variables used on the feature vector. <br /> 
It gives, The complete list of variables of each feature vector is available in 'features.txt'.  <br /> 
This includes the Statistics Summary Features: 

3. features.txt: List of all features.  <br />

4. subject_test.txt: Information regareding the Subject.  <br />
There were 30 volunteers seperate into Groups. <br />

5. X_test.txt: The Testing   <br />

6. y_test.txt: The Test Labels; Activites for Testing  <br />

7. subject_train.txt: Information Regarding the Subjects  <br />

8. X_train.txt: The Training;   <br />

9. y_train.txt: The Training Labels; Activities for Traning  <br />

# Transformation of Variable and File names:  <br />
Variable: test_set, the X_test.txt file, for Testing  <br />
Variable: test_set_act, the y_test.txt file, for Activities for Testing  <br />
Variable: test_sub, the subject_test.txt file, for Info about Subjects  <br />
Variable: train_set, the X_train.txt file, for Traning  <br />
Variable: train_set_act, the y_train.txt file, for Activities for Traning  <br />
Variable: train_sub, the subject_train.txt file, for Info about Subjects  <br />
Variable: activities, the activity_labels.txt file, for Data on different activities  <br />
Variable: features, the features.txt file, for Statistics Summary Features of the Activity Variables

# Anaysis/Subsetting:
Used Traditional Method of Subseting to seperate data; Detail notes can be found in the  <br />
run_analysis.R file in the this GitHub REPO account or in the CodeBook also attatched to this REPO.

# Output of Files:
write.table() was Utilized to Produce a text file named "tidy.txt" by comma <br />
delimited values in file. This file contains Clean/Tidy Data of the average of each variable for each<br /> activity and each subject. <br />



