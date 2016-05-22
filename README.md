#Getting and Cleaning Data Course Project Assignment

##Introduction
The purpose of this project is to demonstrate the ability to collect, work with, and clean a data set. The data provided for this project represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

##Human Activity Recognition Using Smartphones Dataset
Experiments were carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz were captured. The experiments were video-recorded to label the data manually. The obtained dataset was randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

This repository contains a code book (CodeBook.md) that describes the variables, the data, and the transformations that I performed to clean up the data. The code book updates and modifies the original readme.txt and features_info.txt that were given with the data for this project.


##Analysis 
The analysis for this project merged the training and test sets to produce a new tidy data set displying the average of each variable for each activity and each subject.

As per the project instructions I have written an R script called run_analysis.R that does the following:

*Merges the training and the test sets to create one data set.
*Extracts only the measurements on the mean and standard deviation for each measurement.
*Uses descriptive activity names to name the activities in the data set
*Appropriately labels the data set with descriptive variable names.
*From the data set in step 4, creates a second, independent tidy data set (tidy_data.txt) with the average of each variable for each activity and each subject.


##Acknowledgements
Thank you to the authors for the use of this dataset:

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
