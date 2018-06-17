# this R script reads the Samsung data found in the repo directory
# and performs operations as follows:

# 0. Read activity labels
# 1. Read Activity and feature variables for test and train data, and merge them
# 2. Extract mean and standard deviation variables
# 3. Replace activity id with activity labels
# 4. Provide descriptive names to the variables
# 5. Create and write a tidy table with averages for each variable by (subject, activity)

run_analysis <- function() {
   
   # variables to store Activity and features
   m_activities <- NULL
   m_features <- NULL
   
   # variables for data sets
   m_datasetTrainTest <- NULL
   m_datasetMeanStd <- NULL
   m_tidySetMeans <- NULL
   
   
   # 0. Read activity labels
   readLabels <- function() {
      m_activities <<- read.table("./data/UCI HAR Dataset/activity_labels.txt")
      m_features <<- read.table("./data/UCI HAR Dataset/features.txt")
      #print(m_activities)
   }
   
   
   # 1. Read Activity and feature variables for test and train data, and merge them
   mergeTrainAndTest <- function() {
      
      # form train data by cbinding subjectId, activityId and train feature observation
      subjectIds <- read.table("./data/UCI HAR Dataset/train/subject_train.txt")
      activityIds <- read.table("./data/UCI HAR Dataset/train/y_train.txt")
      dataFeatures <- read.table("./data/UCI HAR Dataset/train/X_train.txt")
      m_datasetTrainTest <<- cbind(subjectIds, activityIds, dataFeatures)

      # form test data by cbinding subjectId, activityId and test feature observation
      subjectIds <- read.table("./data/UCI HAR Dataset/test/subject_test.txt")
      activityIds <- read.table("./data/UCI HAR Dataset/test/y_test.txt")
      dataFeatures <- read.table("./data/UCI HAR Dataset/test/X_test.txt")
      dataTest <- cbind(subjectIds, activityIds, dataFeatures)

      # merge train and test now
      m_datasetTrainTest <<- rbind(m_datasetTrainTest, dataTest)
      
      # variable names are now added to the data set
      headers <- c("Subject", "Activity", as.character(m_features[,2]))
      colnames(m_datasetTrainTest) <<- headers
   }
   
   
   # 2. Extract first 2 cols, mean and standard deviation variables
   extractMeanStd <- function(){
      colsToExtract <- grepl("Subject|Activity|mean..|std..",
                             colnames(m_datasetTrainTest))
      m_datasetMeanStd <<- m_datasetTrainTest[,colsToExtract]
   }
   
   
   # 3. Replace activity id with activity labels
   labelActivities <- function(){
      m_datasetMeanStd$Activity <<- factor(m_datasetMeanStd$Activity,
                                           levels = m_activities[,1],
                                           labels = m_activities[,2])
   }
   
   
   # 4. Provide descriptive names to the variables
   describeColumns <- function(){
      headers <- colnames(m_datasetMeanStd)
      
      # remove punctuations, and sub descriptive nams
      headers <- gsub("^f", "FrequencyDomain",
                      gsub("^t", "TimeDomain",
                           gsub("BodyBody", "Body",
                                gsub("[[:punct:]]", "", headers))))
      headers <- gsub("Gyro", "Gyroscope",
                      gsub("Acc", "Accelerometer",
                           gsub("std", "StandardDeviation",
                                gsub("mean", "Mean", 
                                     gsub("Mag", "Magnitude", headers)))))
      colnames(m_datasetMeanStd) <<- headers
   }
   
   
   # 5. Create and write a tidy table with averages for each variable by (subject, activity)
   createTidyMeans <- function(){
      library(dplyr)
      m_tidySetMeans <<- m_datasetMeanStd %>%
         group_by(Subject, Activity) %>% summarize_all(mean)
      m_tidySetMeans %>%
         write.table(file = "./data/UCI HAR Dataset/tidyDataSet.txt",
                     row.names = FALSE, quote = FALSE)
   }
   
   
   # call the chain of functions that do the job
   readLabels()
   mergeTrainAndTest()
   extractMeanStd()
   
   # remove unnecessary datasets
   rm(m_datasetTrainTest, m_features)

   labelActivities()
   describeColumns()
   createTidyMeans()
   #print(dim(m_tidySetMeans))

}