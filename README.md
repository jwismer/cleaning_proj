---
title: "README"
author: "jwismer"
date: "Saturday, September 20, 2014"
output: html_document
---

This is the REAME.md file for the Getting and Cleaning Data course project. This document describes the project files and how to run them.  See the CodeBook.md for information on the project, the dataset, and the transformations.

##Files:
run_analysis.R -- R script to pull the project data and apply transofrmations to make a tidy dataset.  Requires the dplyr package.

CodeBook.md -- R markdown file providing details on the dataset variables, data, and transformations applied to the data to create a tidy dataset.

README.md -- R markdown file providing package and runtime details of the project.

##Usage:
To run in an R environment, type:
```source("./run_analysis.R")```

##Dependencies:
run_analysis.R requires the dplyr library.  This library must be installed into the R environment prior to running the script.

##Data Source:
The dataset associated with this project was obtained from:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

A description is available at the site the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

##Script Details:
###run_analysis.R
1. Download the data package: 
    + by accessing URL  
    + File is saved in local filesystem as getdata-projectfiles-UCI_HAR_Dataset.zip
    + File is unzipped in local filesystem
2. Read datasets into R environment:
    + load train data from ./UCI HAR Dataset/train/X_train.txt
    + load test data from ./UCI HAR Dataset/test/X_test.txt
    + load the features data from ./UCI HAR Dataset/features.txt
3. Combine datasets
    + combine the train and test datasets to create a master dataset
    + add column names to the master dataset based on the features data
4. Manage subject data
    + load subject data for training set from ./UCI HAR Dataset/train/subject_train.txt
    + load subject data for test set from ./UCI HAR Dataset/test/subject_test.txt
    + combine training and test subject data, preserving same order used when combining raw data
    + add column header
5. Manage activity data
    + load activity data for training set from ./UCI HAR Dataset/train/yt_train.txt
    + load activity data for test set from ./UCI HAR Dataset/test/y_test.txt
    + combine training and test activity data, preserving same order used when combining raw data
    + load activity labels from ./UCI HAR Dataset/activity_labels.txt
    + convert numeric activity data into factors
6. Trim master dataset to remove unwanted columns
    + subset master data by column names matching "std" anywhere in the column name
    + subset master data by column names matching "mean" anywhere in the column name
    + reorder rows to group similar columns by name
7. Add Subject and Activity variables
    + add Subject data as new column to trimmed dataset
    + add Activity data as new column to trimmed dataset
    + apply the activity labels to the Activity factors
8. Aggregate by Subject and Activity and summarize by means
    + load the dplyr library
    + aggregate the trimmed dataset by subject and activity, calcualte means of all vairables
    + output to screen
    