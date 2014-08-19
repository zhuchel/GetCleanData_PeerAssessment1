#run_analysis.R script for Coursera Getting and Cleaning Data peer assessment

#Required libraries
library(reshape2)

#Path prefixes
rootPath <- "./UCI HAR Dataset/"
testPath <- "test/"
trainPath <- "train/"

## Main steps 
## 1. Merges the training and the test sets to create one data set.
## 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
## 3. Uses descriptive activity names to name the activities in the data set
## 4. Appropriately labels the data set with descriptive variable names. 
## 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

####################################################################
### Read data
####################################################################
#features
rawFeatures <- read.table(paste0(rootPath, "features.txt"))
#activities
activityLabels <-read.table(paste0(rootPath, "activity_labels.txt"))
#subjects
subjectTest <- read.table(paste0(rootPath, testPath, "subject_test.txt"))
subjectTrain <- read.table(paste0(rootPath, trainPath, "subject_train.txt"))
#test set
xTest <- read.table(paste0(rootPath, testPath, "X_test.txt"))
yTest <- read.table(paste0(rootPath, testPath, "y_test.txt"))
#train set
xTrain <- read.table(paste0(rootPath, trainPath, "X_train.txt"))
yTrain <- read.table(paste0(rootPath, trainPath, "y_train.txt"))

####################################################################
### 1. Merges the training and the test sets to create one data set.
####################################################################
#mix observations
observations <- rbind(xTest, xTrain) 
#mix activities
activities <- rbind(yTest, yTrain) 
#mix subjects
subjects <- rbind(subjectTest, subjectTrain)
colnames(subjects)<-"subjectID"

####################################################################
### 2. Extracts only the measurements on the mean and standard
###    deviation for each measurement.
####################################################################

#Select the column indexes for mean, standard
featuresIndexes <- sort(rbind(grep("mean\\(\\)", rawFeatures[,2]), grep("std\\(\\)", rawFeatures[,2])))
observations<-observations[, featuresIndexes]
features <-rawFeatures[featuresIndexes, 2]

####################################################################
### 3. Uses descriptive activity names to name the activities in 
###    the data set.
####################################################################
features<-sub("^t","Time",features) 
features<-sub("^f","Freq",features)
features<-sub("-mean\\(\\)","Mean",features)
features<-sub("-std\\(\\)","StdDev",features)
features<-sub("BodyBody","Body",features)
features<-sub("-","",features)
colnames(observations)<-features

####################################################################
### 4. Appropriately labels the data set with descriptive variable 
###    names. 
####################################################################
colnames(activities)[1]<-"activityID"
activities$activity <- apply(activities, 1, 
                             function(row) sub("_", "", tolower(activityLabels[row[1],2])))

####################################################################
### 5. Creates a second, independent tidy data set with the average
###    of each variable for each activity and each subject. 
####################################################################
compound <- cbind(subjects, activities, observations)
converted <- melt(compound, c("subjectID", "activityID", "activity"))
clean <- dcast(converted, activityID + subjectID + activity ~ variable, mean)
write.table(clean, file="TidyData.txt", sep=",", eol="\n", row.names=FALSE)