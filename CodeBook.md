Code Book for Getting and Cleaning Data Assignment
========================================================

This file describes the data, the variables,  and any transformations or work that you performed to clean up the data  called codebook.md

### The HAR Data Set 

The HAR data set can be obtained as a zip file from the [UCI machine learning archive](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip). It records data from experiments in which 30 subjects performed six activities (walking, walking up stairs, walking down stairs, sitting, standing, laying) while carrying a Samsung Galaxy S II smartphone. The gyroscope and accellerometer signals from the smartphone were recorded into raw data files, and then these files were processed into two sets of feature files, a training set and a testing set, to be used in a machine learning experiment trying to learn how to identify these activities from the signal data. 

The processed data is largely represented in two files, X_train.txt and X_test.txt, recorded as 561 variables. The values for each of these variables has been normalized to a range between -1 and 1, and each data observation is recorded as a single row in the file. 

The file *features_info.txt* (included in the zip file linked above) contains a narrative description of each of the features in the original data files. The basic features, as described there, are 

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

The features with XYZ in their names are triaxial, and there are three values for each. For each feature, a number of variables had been calculated; however, for the purposes of this assignment, we were concerned only with the Mean value and Standard deviation variables:

mean(): Mean value   
std(): Standard deviation   

Additional files in the *Inertial Signals* subdirectories of the *test* and *train* directories are ignored for the purposes of this assignment.


### Files in the raw data set
* * *
#### `/UCI HAR Dataset` Directory

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

Activities:

1 WALKING
2 WALKING_UPSTAIRS
3 WALKING_DOWNSTAIRS
4 SITTING
5 STANDING
6 LAYING
 

### The Product Data Set 

The repository for the project contains the script for generating of the *TidyData.txt* file.

The *TidyData.txt* file contains only the 66 mean and standard deviation value variables (those columns whose names include "mean()" and "std()" in their column names) for each of the 10,299 observations, with tidied column names and activity labels. 

The *TidyData.txt* file contains contains only the 66 mean and standard deviation value variables 66, for each activity, for each subject.  

## Variable List and Description

The variable names (column names) for both files / data sets are as follows. 

*ID Variables*
The first two variables are integer id variables, uniquely identifying each subject and each activity. 
The activityID variable was left in the summary to simplify the process of identifying discrete activities
The third variable is a charcter variable, labelling each activity uniquely. 

*Data Feature Variables*
Each of the following variables are floats in a range between -1 and 1; they are unitless values which represent the original recorded values. Those variables whose names that begin with the word "Time" are time domain variables, those that begin with "Freq" are frequency domain variables. Those that end with X, Y, or Z represent the X, Y, or Z axis value for a three-axial measure (gyroscope measurements,  or acceleration measurements derived from the accelerometer). Those which contain Mean are mean values, while those which contain StdDev are standard deviations. The decision was made to camel case the variable names for readability, and to use abbreviations for standard deviation, frequency, gyroscope and accelerometer to prevent overly long variables.

### ID variables
subjectID   
activityID   
activity   

### Time Domain Variables
#### Body Accelaration Variables
TimeBodyAccMeanX   
TimeBodyAccMeanY   
TimeBodyAccMeanZ   
TimeBodyAccStdDevX   
TimeBodyAccStdDevY   
TimeBodyAccStdDevZ   

#### Gravity Acceleration Variables
TimeGravityAccMeanX   
TimeGravityAccMeanY   
TimeGravityAccMeanZ   
TimeGravityAccStdDevX   
TimeGravityAccStdDevY   
TimeGravityAccStdDevZ   

#### Body Acceleration Jerk Variables
TimeBodyAccJerkMeanX   
TimeBodyAccJerkMeanY   
TimeBodyAccJerkMeanZ   
TimeBodyAccJerkStdDevX   
TimeBodyAccJerkStdDevY   
TimeBodyAccJerkStdDevZ

#### Body Gyroscope Variables
TimeBodyGyroMeanX   
TimeBodyGyroMeanY   
TimeBodyGyroMeanZ   
TimeBodyGyroStdDevX   
TimeBodyGyroStdDevY   
TimeBodyGyroStdDevZ   

#### Body Gyroscope Jerk Variables
TimeBodyGyroJerkMeanX   
TimeBodyGyroJerkMeanY   
TimeBodyGyroJerkMeanZ   
TimeBodyGyroJerkStdDevX   
TimeBodyGyroJerkStdDevY   
TimeBodyGyroJerkStdDevZ   

#### Body Acceleration Magnitude Variables
TimeBodyAccMagMean   
TimeBodyAccMagStdDev   

#### Gravity Acceleration Magnitude Variables
TimeGravityAccMagMean   
TimeGravityAccMagStdDev   

#### Body Acceleration Jerk Magnitude Variables
TimeBodyAccJerkMagMean   
TimeBodyAccJerkMagStdDev 

#### Body Gyroscope Magnitude Variables
TimeBodyGyroMagMean   
TimeBodyGyroMagStdDev   

#### Body Gyroscope Jerk Magnitude Variables
TimeBodyGyroJerkMagMean   
TimeBodyGyroJerkMagStdDev   

### Frequency Domain Variables
#### Body Accelaration Variables
FreqBodyAccMeanX   
FreqBodyAccMeanY   
FreqBodyAccMeanZ   
FreqBodyAccStdDevX   
FreqBodyAccStdDevY   
FreqBodyAccStdDevZ   

#### Body Acceleration Jerk Variables
FreqBodyAccJerkMeanX   
FreqBodyAccJerkMeanY   
FreqBodyAccJerkMeanZ   
FreqBodyAccJerkStdDevX   
FreqBodyAccJerkStdDevY   
FreqBodyAccJerkStdDevZ   

#### Body Gyroscope Variables
FreqBodyGyroMeanX   
FreqBodyGyroMeanY   
FreqBodyGyroMeanZ   
FreqBodyGyroStdDevX   
FreqBodyGyroStdDevY   
FreqBodyGyroStdDevZ   

#### Body Acceleration Magnitude Variables
FreqBodyAccMagMean   
FreqBodyAccMagStdDev   

#### Body Acceleration Jerk Magnitude Variables 
FreqBodyAccJerkMagMean   
FreqBodyAccJerkMagStdDev

#### Body Acceleration Jerk Magnitude Variables 
FreqBodyGyroMagMean   
FreqBodyGyroMagStdDev   

#### Body Gyroscope Jerk Magnitude Variables
FreqBodyGyroJerkMagMean   
FreqBodyGyroJerkMagStdDev   






