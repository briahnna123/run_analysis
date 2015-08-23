## CodeBook
***Important Note: My explination of how all of the scripts work and how they are connected starts on Line 18.  <br />

This should contain, a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called.  <br />
Specifically, this book details the run_analyis.R changes to the raw data transformed to the clean/tidy data used in later evaluation.

# Background Information:
"The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain."


[UCI](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

Zip file Citation of Data: [Source](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) <br />
Original Source [UCI] (http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)
<br />

# Raw Data Breakdown: <br />

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

# Data Alterations/Transformations
All of the text files found in UCI HAR Dataset were read into a table; Specific Names Explained in README.md file. <br />
All files were remanmed as follows-- Transformation of Variable and File names:  <br />
Variable: test_set, the X_test.txt file, for Testing  <br />
Variable: test_set_act, the y_test.txt file, for Activities for Testing  <br />
Variable: test_sub, the subject_test.txt file, for Info about Subjects  <br />
Variable: train_set, the X_train.txt file, for Traning  <br />
Variable: train_set_act, the y_train.txt file, for Activities for Traning  <br />
Variable: train_sub, the subject_train.txt file, for Info about Subjects  <br />
Variable: activities, the activity_labels.txt file, for Data on different activities  <br />
Variable: features, the features.txt file, for Statistics Summary Features of the Activity Variables <br />
Details Explained in README.md file or run_analysis.R file.


# Completed Clean/Tidy Data <br />
The file extracted is called "tidy_data.txt". This file contains the clean data with the mean and standard deviation for each measurement along with Descriptive Headers. Specific Names Explained in run_analysis.R file.



