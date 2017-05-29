README run_analysis.R and IndependentData.txt

This data set was derived from the following study:
[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.

Brief description of the study:
A group of experiments carried out on 30 volunteers divided into two groups consisting of "test" group and "train" group.  While wearing a smartphone (Samsung Galaxy S II) each volunteer was asked to perform six tasks: "Walking" (presumably on a flat surface), "Walking Up Stairs", "Walking Down Stairs", "Sitting","Standing" and "Laying".  Using the gyroscope and accelerometer data was captured at regular intervals.  To learn more about the experiment please see the original publication at 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
What was done to this data?
This data was manipulated to make it more "tidy" and user-friendly.  This includes adding labels to the data set with descriptive variable names and descriptive activity names to make the findings easier to read.  Merging the training and test sets to create one data set, so all data can be looked at collectively.  Also, r function "subset()" was used to extract only the measurements pertaining to standard deviation and means to make the data more manageable and relevant.
Lastly, a new data set was created, taking only the averages of each variable for each activity and each subject to give a quick reference and summary of findings.
  Why is this data set considered "tidy"?
Based off the definition of "tidy" data from "Getting and Cleaning Data" Coursera course by Jeffrey Leek, "tidy" data contains the following:  "Each variable you measure should be in one column", "Each different observation of that variable should be in a different row", "There should be one table for each "kind" of variable"
Using this definition, we see that the IndependentData.txt is indeed a "tidy" data set with a single unique variable in each column, which is easy to read and understand.  Each observation has its own line, and that line is labled from which subject in the study it was taken from, as well as which activity they were performing at the time. There is only one table saved to the file making it easy to access.