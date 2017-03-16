# run_analysis.R
#

# required 
library(dplyr)

# get vector of activity labels
# DataSource name
dataSource = "./UCI HAR Dataset"
activityLableFile <- paste0(dataSource, "/activity_labels.txt")
if (file.exists(activityLableFile)) {
  activityLabels = read.table(activityLableFile)
} else {
  stop(paste(activityLableFile,"does not exist."))
}
activityNames = tolower(as.character(activityLabels[,2]))

# get vector features
vectorFeaturesFile = paste0(dataSource,"/features.txt")
if (file.exists(vectorFeaturesFile)) {
  featureLables = read.table(vectorFeaturesFile)
} else {
  stop(paste(vectorFeaturesFile,"does not exist."))
}
featureNames = as.character(featureLables[,2])

# get the data from both "./test" and "./train"

testdir <- paste0(dataSource,"/test")
traindir <- paste0(dataSource,"/train")

# training dataframe
if (file.exists(traindir)) {
  trainTab <- read.table(paste0(traindir,"/X_train.txt"))
  
  # get original names for variables
  names(trainTab) = featureNames
  
  # add subjects variable to the dataframe
  trainSubj = read.table(paste0(traindir,"/subject_train.txt"))
  subject = as.numeric(trainSubj[,1])
  trainTab <- cbind(subject,trainTab)
  
  # add activities variable to the dataframe
  # 3. change the value of the activity variable to a character string
  trainActivity = read.table(paste0(traindir,"/y_train.txt"))
  trainNum = as.numeric(trainActivity[,1])
  activity = vector()
  for (x in 1:length(trainNum) ){activity[x] = activityNames[trainNum[x]]}
  trainTab <- cbind(activity, trainTab)
}

# testing dataframe
if (file.exists(testdir)) {
  testTab <- read.table(paste0(testdir, "/X_test.txt"))
  
  # get original names for variables
  names(testTab) = featureNames
  
  # add subjects to the dataframe
  testSubj = read.table(paste0(testdir,"/subject_test.txt"))
  subject = as.numeric(testSubj[,1])
  testTab <- cbind(subject,testTab)
  
  # add activities to the dataframe
  testActivity = read.table(paste0(testdir,"/y_test.txt"))
  testNum = as.numeric(testActivity[,1])
  activity = vector()
  
  # 3. change the value of the activity variable to a character string
  for (x in 1:length(testNum) ){activity[x] = activityNames[testNum[x]]}
  testTab <- cbind(activity, testTab)
}

# 1. merge test and training data into one dataset
allDataTab = rbind(trainTab,testTab)

# 2. extract just measurements on mean and standard deviation (and subject and activity)
meanAndStdData <- allDataTab[grep("(*std\\(\\)*)|(*mean\\(\\)*)|subject|activity",colnames(allDataTab))]

# 4  #tweak the feature names a bit
mdFeatureNames = colnames(meanAndStdData)

# Stay with camel caps theme -- get rid of () though
mdFeatureNames = gsub("mean()","Mean", mdFeatureNames, fixed=TRUE)
mdFeatureNames = gsub("std()","Std", mdFeatureNames, fixed=TRUE)
#get rid of commas and dashes
mdFeatureNames = gsub(",|-","", mdFeatureNames)
#get rid of any ( and )
mdFeatureNames = gsub("(","", mdFeatureNames, fixed=TRUE)
mdFeatureNames = gsub(")","", mdFeatureNames, fixed=TRUE)

names(meanAndStdData) = mdFeatureNames

# 5 create new dataset set with the average of each 
# variable for each activity and each subject

summaryDataSet = meanAndStdData %>% group_by(activity,subject) %>% summarize_each(funs(mean))

# write dataset to a file
write.csv(summaryDataSet, "./MeanSummaryDataSet.csv")

