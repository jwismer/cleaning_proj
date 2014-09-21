#Download data and create a tidy dataset as instructed in the "Getting and Cleaning Data" project

#datasource location
fileurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
filename <- "./getdata-projectfiles-UCI_HAR_Dataset.zip"

#conditionally download the file
if (!file.exists(filename)) {
    download.file(fileurl, destfile=filename)
    unzip(filename, exdir=".")
}

#conditionally load the training and test datasets
if (!exists("x_train")) {
    x_train <- read.table("./UCI HAR Dataset/train/X_train.txt", quote="\"")
}
if (!exists("x_test")) {
    x_test <- read.table("./UCI HAR Dataset/test/X_test.txt", quote="\"")
}
#load the feature names
features <- read.table("./UCI HAR Dataset/features.txt", quote="\"")

#combine the train and test dataset to create one master dataset to rule them all
master_data <- rbind(x_train, x_test)
#add column headers
colnames(master_data) <- features$V2

#handle the subject data
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt", quote="\"")
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt", quote="\"")
subj <- rbind(subject_train, subject_test)
colnames(subj) <- "Subject"

#activity data requires mapping to the names
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt", quote="\"")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt", quote="\"")
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt", quote="\"")
Activity <- as.factor(rbind(y_train, y_test)$V1)

#trim to only std and mean column, mathing anywhere in the column name
trim_data <- cbind(master_data[, grepl("std", names(master_data))], 
                   master_data[, grepl("mean", names(master_data))] )
#reorder columns to group similar colmns by name
trim_data <- trim_data[, order(names(trim_data))]

#combine with subject and activity data
trim_data <- cbind(trim_data, subj)
trim_data <- cbind(trim_data, Activity)
#use the descriptive activity names as factors
trim_data$Activity <- activity_labels[trim_data$Activity,]$V2
trim_data

#aggregate by subject and activity and calculate means
library(dplyr)
mean_data<-trim_data %>% group_by(Subject, Activity) %>% summarise_each(funs(mean))
mean_data
write.table(mean_data, file="./mean_data.txt", row.names=FALSE)
