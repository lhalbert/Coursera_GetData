##############################################################################
#
# Written By: Louis Halbert
# Date: 4 Sep 2014
#
##############################################################################

##############################################################################
#Download Data
##############################################################################
#Check to see if data dir exists
if (!file.exists("data")) {
     message("Creating data directory...")
     dir.create("data")
}
if (!file.exists("data/UCI HAR Dataset")) {
     #Download the data
     fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
     zipfile="data/UCI_HAR_data.zip"
     message("Downloading data...")
     download.file(fileURL, destfile=zipfile, method="curl")
     unzip(zipfile, exdir="data")
}
message("Download Data Complete!")
message(" ")

##############################################################################
#Read Data
##############################################################################
message("reading X_train.txt...")
training.x <- read.table("data/UCI HAR Dataset/train/X_train.txt")

message("reading y_train.txt...")
training.y <- read.table("data/UCI HAR Dataset/train/y_train.txt")

message("reading subject_train.txt...")
training.subject <- read.table("data/UCI HAR Dataset/train/subject_train.txt")

message("reading X_test.txt...")
test.x <- read.table("data/UCI HAR Dataset/test/X_test.txt")

message("reading y_test.txt...")
test.y <- read.table("data/UCI HAR Dataset/test/y_test.txt")

message("reading subject_test.txt...")
test.subject <- read.table("data/UCI HAR Dataset/test/subject_test.txt")

message("Reading Data Complete!")
message(" ")

##############################################################################
#Merge Data
##############################################################################
merged.x <- rbind(training.x, test.x)
merged.y <- rbind(training.y, test.y)
merged.subject <- rbind(training.subject, test.subject)
mergeData <- list(x=merged.x, y=merged.y, subject=merged.subject)
message("Merge Data Complete!")
message(" ")
##############################################################################
#Extract only the measurements on the mean & Std Dev. for @ measurement.
##############################################################################
#Read the feature list file
features <- read.table("data/UCI HAR Dataset/features.txt")

#Find the mean and std columns
mean.col <- sapply(features[,2], function(x) grepl("mean()", x, fixed=T))
std.col <- sapply(features[,2], function(x) grepl("std()", x, fixed=T))

#Extract them from the data
extractData <- mergeData$x[, (mean.col | std.col)]
colnames(extractData) <- features[(mean.col | std.col), 2]

message("Extract Measurements Complete!")
message(" ")

##############################################################################
#Uses descriptive activity names to name the activities in the data set
##############################################################################
yData <- mergeData$y
colnames(yData) <- "activity"
yData$activity[yData$activity == 1] = "WALKING"
yData$activity[yData$activity == 2] = "WALKING_UPSTAIRS"
yData$activity[yData$activity == 3] = "WALKING_DOWNSTAIRS"
yData$activity[yData$activity == 4] = "SITTING"
yData$activity[yData$activity == 5] = "STANDING"
yData$activity[yData$activity == 6] = "LAYING"

colnames(mergeData$subject) <- c("subject")

message("Activity Names Complete!")
message(" ")

# Combine mean-std values (x), activities (y) and subjects into one data
# frame.

combindData <- cbind(extractData, yData, mergeData$subject)

message("Combine Measurements Complete!")
message(" ")

##############################################################################
#Create an independent tidy dataset
##############################################################################
library(plyr) #tools for splitting, applying and combining data
tidy <- ddply(combindData, .(subject, activity), 
              function(x) colMeans(x[,1:60]))

# Write tidy dataset as csv
write.csv(tidy, "UCI_HAR_tidy_data.csv", row.names=FALSE)

message("Tidy data file Complete!")
