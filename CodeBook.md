# CodeBook

The data used in this project originally came from the UCI HAR Dataset, dowloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.
This is a dataset is also described as Human Activity Recognition Using Smartphones Dataset
Version 1.0. The script ##run_analysis.R## was created in this project to manipulate the UCI HAR Dataset to create a second, independent tidy data set  #meanAndStdData#, with the average of each variable related to mean or standard deviation for each activity and each subject of the UCI HAR Dataset.

As described in the original UCI HAR dataset README file:

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The original experiment had a 561 value feature vector for each subject for each activity the subject participated in.

