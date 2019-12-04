setwd("C:/Users/S.kh/Desktop/Coursera")
library(dplyr)

##Reading data from Working directory!

activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt", col.names = c("code", "activity"))
features <- read.table("./UCI HAR Dataset/features.txt", col.names = c("n", "functions"))
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt", col.names = "subjects")
x_test <- read.table("./UCI HAR Dataset/test/X_test.txt", col.names = features$functions)
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt", col.names = "code")
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt", col.names = "subjects")
x_train <- read.table("./UCI HAR Dataset/train/X_train.txt", col.names = features$functions)
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt", col.names = "code")

##Merge the training and the test sets to create one data set.

x <- rbind(x_train, x_test)
y <- rbind(y_train, y_test)
subject <- rbind(subject_train, subject_test)
data <- cbind(subject, y, x)

##Extract only the measurements on the mean and standard deviation for each measurement

data <- data %>% select(subjects, code, contains("mean"), contains("std"))

##Use descriptive activity names to name the activities in the data set

data$code <- activity_labels[data$code, 2]

##Appropriately labels the data set with descriptive variable names.

names(data)[2] = "activity"
names(data) <- gsub("^f", "Frequency", names(data))
names(data) <- gsub("^t", "Time", names(data))
names(data) <- gsub("BodyBody", "Body", names(data))
names(data) <- gsub("Acc", "Accelerometer", names(data))
names(data) <- gsub("Gyro", "Gyroscope", names(data))
names(data) <- gsub("std", "StandardDeviation", names(data))
names(data) <- gsub("Mag", "Magnitude", names(data))
names(data) <- gsub("Freq", "Frequency", names(data))
names(data) <- gsub("mean", "Mean", names(data))

##Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

data_second <- data %>% group_by(subjects, activity) %>% summarize_all(list(mean))
write.table(data_second, "Tidydata.txt", row.names = FALSE, quote = FALSE)