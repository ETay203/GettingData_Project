
##Reading in data
features<-read.table("./features.txt",header = FALSE, sep = "", stringsAsFactors = FALSE) ##List of all features
activity_labels<-read.table("./activity_labels.txt",header = FALSE, sep = "") ##Links the class labels with their activity name.

##Train files
subject_train<-read.table("./train/subject_train.txt",header = FALSE, sep = "") ## Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
X_train<-read.table("./train/X_train.txt",header = FALSE, sep = "") ## Training set.
y_train<-read.table("./train/y_train.txt",header = FALSE, sep = "") ## Training labels.

##Test files
subject_test<-read.table("./test/subject_test.txt",header = FALSE, sep = "") ## as per subject_train
X_test<-read.table("./test/X_test.txt",header = FALSE, sep = "") ## Test set.
y_test<-read.table("./test/y_test.txt",header = FALSE, sep = "") ## Test labels.

##Librarys for clean up
library(dplyr)
library(tidyr)
library(data.table)

##1. Merges the training and the test sets to create one data set.
full_set<-rbind(X_test, X_train)

full_subject<-rbind(subject_test, subject_train)
full_subject<-rename(full_subject, subject = V1)

full_labels<-rbind(y_test, y_train)
full_labels<-rename(full_labels, labels = V1)

##2. Extracts only the measurements on the mean and standard deviation for each measurement.
toMatch <- c("-mean", "-std")
feature_match <- unique(grep(paste(toMatch,collapse="|"), 
                        features$V2))
#match_std<-grep("-std()", features$V2, fixed = TRUE)
#match_mean<-grep("-mean()", features$V2, fixed = TRUE)

##selecting variables in full_set that contain "mean()" and "std()" (also includes meanFreq())
mean_std_set <-select(full_set, num_range("V", feature_match))
mean_std_features<-filter(features, features$V1 %in% feature_match)


##4. Appropriately labels the data set with descriptive variable names.
##convert features to variable headings
names(mean_std_set)<-mean_std_features[,2]

##edit features to remove"-" and "()"

names(mean_std_set)<-gsub("-", "_", names(mean_std_set))
names(mean_std_set)<-gsub("()", "", names(mean_std_set), fixed="TRUE")


##3. Uses descriptive activity names to name the activities in the data set
##add descriptions to activities in full_labels
full_labels_names<-data.frame(labels=full_labels$labels, 
                              activities=activity_labels[match(full_labels$labels, 
                                                               activity_labels$V1), 2])
##add descriptions to mean_std_set
mean_std_set<-mutate(mean_std_set, activities = full_labels_names$activities)

##also add subjects
mean_std_set<-mutate(mean_std_set, subject = full_subject$subject)


##5.From the data set in step 4, creates a second, independent tidy data set with 
##the average of each variable for each activity and each subject.

mean_std_grouped<-mean_std_set %>%
                  group_by(activities,subject)%>%
                  summarise_each(funs(mean))

#writes the tidy set to a file grouped_average.txt
write.table(mean_std_grouped, file = "tidy_data.txt", row.names = FALSE )

