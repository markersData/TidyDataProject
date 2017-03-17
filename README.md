# TidyDataProject

This project contains the script **run_analysis.R**. The script performs an analysis on a 
UCI HAR Dataset. 

**Run_analysis.R** does the following:
1.  merges of test and training data from the UCI HAR Dataset into one big data set.  
2.  labels all the variables in the dataset with descriptive strings from a vector features file. 
3.  adds a variable column that identifies the subject id for each observation and a variable column that describes the activity that the subject was performing when the other variables values were measured. Activity names are set to descriptive strings.
4. From the big dataset it extracts just the measurements of mean and standard deviation. It tweaks the variables names a bit (removes "(),-") and standardizes on CamelCap names. 
5. Finally it creates a new dataset with the average of each variable for each activity and each subject and writes the dataset to a file named *MeanSummaryDataSet.csv*.

