# GetCleanDataProject
Course Project for the 'Getting and Cleaning Data' Coursera Course

##About
The following data files contain data collected from the gyroscopes and accelerometers
collected from a sample of Samsung Galaxy S smartphone users. This data is available
in the UC Irvine Machine Learning Repository

The goal of this analysis is to tidy up the dataset and get it ready for analysis


##Setup
Datasets can be obtained [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) 

Placing the "UCI HAR Dataset" folder within the current working directory will allow
``run_analysis.R`` to access all relevant files.

##Required Dependencies

The package "data.table" is required for this analysis. The attach .R file will automatically
download this package if uninstalled.

##Data

###X_test.txt and X_train.txt
Tables that contain the results from measurements taken from smartphones.
Labels for these measurements are found in features.txt

###y_test.txt and y_train.txt
Vectors of length equal to the rows of the corresponding X table that 
identify what activity the subject was doing at the time of measurement.

###subject_test.txt, subject_train.txt
A vector of length equal to the rows in corresponding X tables that uniquely
identify each subject

###features.txt
A list of variable names for x_test and x_train

###activity_labels.txt
A list of value lables for y_test and y_train

##Procedure
``run_analysis.R`` turns the raw datasets above into tiny data
via the following 5 procedures:

1. Merging the training and the test sets to create one data set.
2. Extracting only the measurements on the mean and standard deviation for each measurement.
3. Using descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject

##Tidy Data
The final tidy dataset is stored as ``tidyData.txt``

More information about that dataset can be been in ``Codebook.md``


