# if the directory does not exist, create one for course 03 (c03)
if (!file.exists("c03-data")) {
   dir.create("c03-data")
}

# download the file, if doesn't exist
destFile <- "./c03-data/uci-har.zip"
if (!file.exists(destFile)) {
   fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
   download.file(fileUrl, destfile = destFile)
}

# NOW create data dir if doesn't exist
if (!file.exists("data")){
   dir.create("data")
}

# Assume that existence of UCI HAR Dataset implies, we have unzipped
if (!file.exists("data/UCI HAR Dataset")) {
   unzip (destFile, exdir = "./data")
}
