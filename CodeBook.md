## CodeBook

This should contain, a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called.  <br />
Specifically, this book details the run_analyis.R changes to the raw data transformed to the clean/tidy data used in later evaluation.

# Background Information:
"The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.


" [UCI](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

Zip file Citation of Data: [Source](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) <br />
Original Source [UCI] (http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)
<br />

# Data Breakdown: <br />

1. activity_labels.txt: "Links the class labels with their activity name."  <br />
2. features_info.txt: "Shows information about the variables used on the feature vector";  <br /> it gives, "The complete list of variables of each feature vector is available in 'features.txt'"
3. features.txt: "List of all features."  <br />
4. subject_test.txt: Information regareding the subject  <br />
5. X_test.txt: "Test set."  <br />
6. y_test.txt: "Test labels."  <br />
7. subject_train.txt:   <br />
8. X_train.txt: " Training set."  <br />
9. y_train.txt: "Training labels."  <br />

# Data Alterations/Transformations
The following text files:  <br />
features.txt, activity_labels.txt, subject_test.txt, subject_train.txt, X_train.txt, X_test.txt, y_train.txt, y_test.txt <br />
were read into a table. Then converted to data frame by dplyr package for easier manipulation.

All files were remanmed as follows:  <br />
features.txt --> features  <br />
activity_labels.txt --> activities  <br />
subject_test.txt --> test_subject  <br />
subject_train.txt --> train_subject  <br />
X_train.txt --> train_x  <br />
X_test.txt, --> test_x  <br />
y_train.txt --> train_y  <br />
y_test.txt --> test_y  <br />
train_x merge test_x --> features_x <br />
train_y merge test_y --> activity_y <br />
train_subject merge test_subjec --> subject_train_test <br />


# Completed Clean/Tidy Data <br />
The file was extracted in a file called "tidy_data.txt". This file contain the clean data with the mean and standard deviation for each measurement along with Headers.



