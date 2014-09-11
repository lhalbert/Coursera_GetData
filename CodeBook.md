#Introduction:

The run_analysis.R script performs the following:

1. Downloads data from UCI Machine Learning Repository
2. Merges the training and test data
3. Replaces the "Activity" values with descriptive names
4. Extracts only the measurements on the mean and standard deviation for each measurement
5. Label data columns with descripitive names
6. Creates an independent tidy dataset with an average of each variable for each activity and each subject.  (tidy dataset provided as txt file)

#Original Data
Represents data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

#Getting and Cleaning Data

If the data is not already in the "data" directory, it is downloaded from the UCI repository.

The process begins with reading all of the training and test data and combining the data into a single dataset.  After the merger, the mean and standard deviation is extracted.

Activity labels are then replaced with descriptive activity names as defined in the provided "activity_labesl.txt" in the original UCI dataset.

The final process creates a tidy dataset with the average of each variable and each subject (provide as "UCI_HDR_tidy_data.txt").