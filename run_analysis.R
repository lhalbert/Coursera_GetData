##############################################################################
#
# Written By: Louis Halbert
# Date: 4 Sep 2014
#
##############################################################################

#Check to see if data dir exists
if (!file.exists("data")){dir.create("data")}

#Download file
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
download.file(fileUrl, "./data/file.xml", method = "curl")
#list.files("./data")

#Set date for download
#dateDownloaded <- Date()

#Read data
colIndex <- 7:15 
rowIndex <- 18:23 
data <- xmlToDataFrame("./data/file.xml")
