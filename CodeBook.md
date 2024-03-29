---
title: "Getting and Cleaning Data Project CodeBook"
author: "jwismer"
date: "Saturday, September 20, 2014"
output: html_document
---

This is an R Markdown document providing a description of the project, as well as the project variables, data, and transformations. Markdown is a simple formatting syntax for authoring HTML, PDF, and MS Word documents. For more details on using R Markdown see <http://rmarkdown.rstudio.com>.

##Introduction
This project is associated with the online course "Getting and Cleaning Data".  See the associated README.md for details on the various components of the project package.  The purpose of the project is to obtain the project dataset from online sources and transform it into a tidy dataset based on a set of project requirements.  The tidy dataset is then summarized by applying mean to the data aggregated by Activity and Subject.

##Data Source
The dataset associated with this project was obtained from the Human Activity Recognition Using Smartphones Data Set, available at the URL:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

A description is available at the site the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

##Data Sets
This project focused on the training and test data found in the ./train/X_train.txt and ./test/X_test.txt files in the data package.

###Files used in project:
* 'features.txt': List of all features.
* 'activity_labels.txt': Links the class labels with their activity name.
* 'train/X_train.txt': Training set.
* 'train/y_train.txt': Training labels.
* 'test/X_test.txt': Test set.
* 'test/y_test.txt': Test labels.

The following file is available for the train and test data.

* 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

##Variables

###Notes from the README in the data package:
* Features are normalized and bounded within [-1,1].
* Each feature vector is a row on the text file.

###Training Data
Training data consists of 7352 observations of 561 variables.

###Test Data
Test data consists of 2947 observations of 561 viariables.

###Subject Data
Each subject in the study is assigned a numeric identifier, ranging from 1 to 30.

Each record in the training and test datasets has an associated subject ID, identify the subject who perfomed the activity.

###Activity Data
Activity data is a factor with 6 levels:

V1 |       V2
---|------------------
1 | WALKING
2 | WALKING_UPSTAIRS
3 | WALKING_DOWNSTAIRS
4 | SITTING
5 | STANDING
6 | LAYING

Each record in the training and test datasets has an associated activity.  

###Variable Names and Meaning
The variable names are provided in the training labels and test labels data.

Since the variables have been normalized, there are no units associated with the variables.

Information in the features_info.txt file found in the data package provides a good explanation of the variables:
```
Feature Selection 
=================

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean

The complete list of variables of each feature vector is available in 'features.txt'
```

##Data
Based on the README obtained with the project dataset:

*The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.*

*The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details.*

For each record the following data are provided:

* Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
* Triaxial Angular velocity from the gyroscope. 
* A 561-feature vector with time and frequency domain variables. 
* Its activity label. 
* An identifier of the subject who carried out the experiment.

##Transformations
The following describes the transformations carried out against the datasets found in the project's data package.

- Combine datasets
    + combined the training dataset (X_train.txt) and the test dataset (X_test.txt) to create a master dataset
    + added column names to the master dataset based on the features data (features.txt)
- Incorporate subject data
    + loaded subject data for training set from ./UCI HAR Dataset/train/subject_train.txt
    + loaded subject data for test set from ./UCI HAR Dataset/test/subject_test.txt
    + combined training and test subject data, preserving same order used when combining raw data
- Incorporate activity data
    + loaded activity data for training set from ./UCI HAR Dataset/train/yt_train.txt
    + loaded activity data for test set from ./UCI HAR Dataset/test/y_test.txt
    + combined training and test activity data, preserving same order used when combining raw data
    + loaded activity labels from ./UCI HAR Dataset/activity_labels.txt
- Trim master dataset to remove unwanted columns
    + subsetted master data by column names matching "std" anywhere in the column name
    + subsetted master data by column names matching "mean" anywhere in the column name
    + reordered rows to group similar columns by name
- Aggregate by Subject and Activity and summarize by means
    + aggregated the trimmed dataset by subject and activity, calcualted means of all vairables
    
