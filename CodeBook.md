#Introduction:

The run_analysis.R script performs the following:

1. Downloads data from UCI Machine Learning Repository
2. Merges the training and test data
3. Replaces the "Activity" values with descriptive names
4. Extracts only the measurements on the mean and standard deviation for each measurement
5. Label data columns with descripitive names
6. Creates an independent tidy dataset with an average of each variable for each activity and each subject.  (tidy dataset provided as txt file)

#Original Data
Represents data collected from the accelerometers from the Samsung Galaxy S smartphone. 

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. 

A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

#Getting and Cleaning Data

If the data is not already in the "data" directory, it is downloaded from the UCI repository.

The process begins with reading all of the training and test data and combining the data into a single dataset.  After the merger, the mean and standard deviation is extracted.

Activity labels are then replaced with descriptive activity names as defined in the provided "activity_labesl.txt" in the original UCI dataset.

The final process creates a tidy dataset with the average of each variable and each subject (provide as "UCI_HDR_tidy_data.txt").