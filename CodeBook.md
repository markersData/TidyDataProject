# CodeBook

The data used in this project originally came from the UCI HAR Dataset, dowloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.
This is a dataset is also described as Human Activity Recognition Using Smartphones Dataset
Version 1.0. The script **run_analysis.R** was created in this project to manipulate the UCI HAR Dataset to create a second, independent tidy data set *meanAndStdData*, which lists the average of each variable related to mean or standard deviation in the UCI HAR Dataset for each activity for each subject of that Dataset.

The original UCI HAR dataset is described in its README file:

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The original experiment had a 561 value feature vector for each subject for each activity the subject participated in.

**run_analysis.R** did the following:
1.  merged test and training data from the UCI HAR Dataset into one big data set.  
2.  labeled all the variables in the dataset with descriptive strings from a vector features file. 
3.  added a variable column that identified the subject for each observation and a variable column that describes the activity that the subject was performing. Activity names were set to descriptive strings.
4. From the big dataset it extracted just the measurements of mean and standard deviation. It tweaked the variables names a bit (removed "(),-") and standardized on CamelCap names. 
5. Finally, it worked with the variables extracted in step 4 to create a new dataset with the average of each variable for each activity and each subject. It wrote the dataset to a file named *MeanSummaryDataSet.csv*.

*MeanSummaryDataSet.csv* has a 68 value feature vector for each subject/activity pair.

Its features/variables are:

[1] "activity"                 "subject"                 
 [3] "tBodyAccMeanX"            "tBodyAccMeanY"           
 [5] "tBodyAccMeanZ"            "tBodyAccStdX"            
 [7] "tBodyAccStdY"             "tBodyAccStdZ"            
 [9] "tGravityAccMeanX"         "tGravityAccMeanY"        
[11] "tGravityAccMeanZ"         "tGravityAccStdX"         
[13] "tGravityAccStdY"          "tGravityAccStdZ"         
[15] "tBodyAccJerkMeanX"        "tBodyAccJerkMeanY"       
[17] "tBodyAccJerkMeanZ"        "tBodyAccJerkStdX"        
[19] "tBodyAccJerkStdY"         "tBodyAccJerkStdZ"        
[21] "tBodyGyroMeanX"           "tBodyGyroMeanY"          
[23] "tBodyGyroMeanZ"           "tBodyGyroStdX"           
[25] "tBodyGyroStdY"            "tBodyGyroStdZ"           
[27] "tBodyGyroJerkMeanX"       "tBodyGyroJerkMeanY"      
[29] "tBodyGyroJerkMeanZ"       "tBodyGyroJerkStdX"       
[31] "tBodyGyroJerkStdY"        "tBodyGyroJerkStdZ"       
[33] "tBodyAccMagMean"          "tBodyAccMagStd"          
[35] "tGravityAccMagMean"       "tGravityAccMagStd"       
[37] "tBodyAccJerkMagMean"      "tBodyAccJerkMagStd"      
[39] "tBodyGyroMagMean"         "tBodyGyroMagStd"         
[41] "tBodyGyroJerkMagMean"     "tBodyGyroJerkMagStd"     
[43] "fBodyAccMeanX"            "fBodyAccMeanY"           
[45] "fBodyAccMeanZ"            "fBodyAccStdX"            
[47] "fBodyAccStdY"             "fBodyAccStdZ"            
[49] "fBodyAccJerkMeanX"        "fBodyAccJerkMeanY"       
[51] "fBodyAccJerkMeanZ"        "fBodyAccJerkStdX"        
[53] "fBodyAccJerkStdY"         "fBodyAccJerkStdZ"        
[55] "fBodyGyroMeanX"           "fBodyGyroMeanY"          
[57] "fBodyGyroMeanZ"           "fBodyGyroStdX"           
[59] "fBodyGyroStdY"            "fBodyGyroStdZ"           
[61] "fBodyAccMagMean"          "fBodyAccMagStd"          
[63] "fBodyBodyAccJerkMagMean"  "fBodyBodyAccJerkMagStd"  
[65] "fBodyBodyGyroMagMean"     "fBodyBodyGyroMagStd"     
[67] "fBodyBodyGyroJerkMagMean" "fBodyBodyGyroJerkMagStd" 
