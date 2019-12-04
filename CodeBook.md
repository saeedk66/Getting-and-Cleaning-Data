# Code Book
a code book that describes the variables, the data, and any transformations or work that performed to clean up the data.

# Data
the data for this codebook can be found on Tidydata.txt

# Variables
There is 88 variables for this data set:

* subject- ID of volunteers.
* activity- six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING).
* All the mean and standard deviation measurements of the the original data set, which is 86 variables.
  * More information can be found on features_info.txt from orginal [Data set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

# Transformations
The following data transformation were applied the the original data set:

1. Merging the training and the test sets to create one data set.
2. Extracting only the measurements on the mean and standard deviation for each measurement.
3. Using descriptive activity names to name the activities in the data set.
4. Appropriately labels the data set with descriptive variable names.
  * Character starting with **f** changed to **frequency**.
  * Character starting with **t** changed to **time**.
  * Acc, Gyro, std, mean, BodyBody, freq, and  mag were replaced with Accelerometer, Gyroscope, StandardDeviation, Mean, Body, Frequency, Magnitude.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
