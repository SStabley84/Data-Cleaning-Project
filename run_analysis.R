#setwd("C:/Users/Samantha/Desktop/data science")
##Download File to Computer and Unzip
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, "./Rawdata.zip")
unzip("Rawdata.zip")

##Appropriately labels the data set with descriptive variable names.

Feature_Names <- read.table("UCI HAR Dataset/features.txt",head=FALSE)

Subject_Test <- read.table("UCI HAR Dataset/test/subject_test.txt")
names(Subject_Test)<- c("Subject")
Test_Labels  <- read.table("UCI HAR Dataset/test/Y_test.txt")
names(Test_Labels)<- c("Activity")
Test_Set     <- read.table("UCI HAR Dataset/test/X_test.txt")
names(Test_Set)<- Feature_Names[,2]

Subject_Train <- read.table("UCI HAR Dataset/train/subject_train.txt")
names(Subject_Train)<- c("Subject")
Train_Labels  <- read.table("UCI HAR Dataset/train/Y_train.txt")
names(Train_Labels)<- c("Activity")
Train_Set     <- read.table("UCI HAR Dataset/train/X_train.txt")
names(Train_Set)<- Feature_Names[,2]

##Merges the training and the test sets to create one data set
Train         <- cbind(Subject_Train, Train_Labels, Train_Set)
Test         <- cbind(Subject_Test, Test_Labels, Test_Set)
Data_set<-rbind(Test,Train)

#Uses descriptive activity names to name the activities in the data set
Data_set[,2]<-gsub(1,"WALKING",Data_set[,2])
Data_set[,2]<-gsub(2,"WALKING_UPSTAIRS",Data_set[,2])
Data_set[,2]<-gsub(3,"WALKING_DOWNSTAIRS",Data_set[,2])
Data_set[,2]<-gsub(4,"SITTING",Data_set[,2])
Data_set[,2]<-gsub(5,"STANDING",Data_set[,2])
Data_set[,2]<-gsub(6,"LAYING",Data_set[,2])

##Extracts only the measurements on the mean and standard deviation for each measurement.

Feature_Names[,2]       <- as.character(Feature_Names[,2])

Narrowed_Feature_Names<-Feature_Names$V2[grep("mean\\(\\)|std\\(\\)", Feature_Names$V2)]
Names<-c(as.character(Narrowed_Feature_Names), "Subject", "Activity" )
Data_set<-subset(Data_set,select=Names)

##Creates data set with the average of each variable for each activity and each subject.
library(plyr)
New_Data<-aggregate(.~Subject + Activity, Data_set, mean)
New_Data<-New_Data[order(New_Data$Subject,New_Data$Activity),]
write.table(New_Data, file = "IndependentData.txt",row.name=FALSE)
