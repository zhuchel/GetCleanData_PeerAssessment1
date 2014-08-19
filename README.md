Coursera Getting and Cleaning Data Assignment
======================

This contains Getting and Cleaning Data Assignment implementation file *run_Analysis.R*, assignment data assignment documentation.

### Assignment

You should create one R script called run_analysis.R that does the following. 

    1. Merges the training and the test sets to create one data set.
    2. Extracts only the measurements on the mean and standard deviation for each measurement. 
    3. Uses descriptive activity names to name the activities in the data set
    4. Appropriately labels the data set with descriptive activity names. 
    5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

The data which the code works upon originates from here

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

Data origin site:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

The zip folder contains mainly two data sets (one called 'test' and one called 'training'). The data itself (identically for both) consists of as set of records obtained by signal processing of measurements from accelerometers and gyroscopes inside samsung devices; these are referred to as X-values. Furthermore, each record can be allocated to one out of 30 test persons (subjects) and one out of 6 defined activities (walking, sitting, etc.); these are referred to as Y-values. More details are omitted here as they are provided with the original data set.

### Repository Content

 1. Data
- **UCI HAR Dataset directory** - contains raw data Human Activity Recognition Using Smartphones Data Set 

 2. Code and documentation
 - *run_analysis.R* - R script for data cleansing
 - *CodeBook.md*    - Data description
 - *README.md*

### To Run

Open the file *run_analysis.R* in RStudio or in R Gui, select all, and then run the file. 
The script will then load necessary files and transform data and create **TidyData.txt** output file.


