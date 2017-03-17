# TidyDataProject

This project contains the script **run_analysis.R**. The script performs an analysis on a 
UCI HAR Dataset. 

**run_analysis.R** does the following:
1.  merges test and training data from the UCI HAR Dataset into one big data set.  
2.  labels all the variables in the big dataset with descriptive strings from a vector features file. 
3.  adds a variable column that identifies the subject for each observation and a variable column that describes the activity that the subject was performing. Activity names are set to descriptive strings.
4. From the big dataset, it extracts just the measurements of mean and standard deviation. It tweaks the variables names a bit (removes "(),-") and standardizes on CamelCap names. 
5. Finally, from the values extracted in step 4 it creates a new dataset with the average of each variable for each activity and each subject. It then writes the new dataset to a file named *MeanSummaryDataSet.csv*.

