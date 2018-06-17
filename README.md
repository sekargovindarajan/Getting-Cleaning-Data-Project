# _Getting And Cleaning Data_ Project
This repo contains R scripts to download, clean and present tidy data for the Human Activity Recognition datasets found in <https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>. First, some general comments on the set up:

* [codeBook.md](./codeBook.md) describes in detail the input and the tidy output datasets, the variables found in the latter, and the transformations of the input dataset that resulted in the tidy output dataset.
* A copy of [tidyDataSet.txt](./tidyDataSet.txt) is attached.
* The scripts [c03-download.R](./c03-download.R) and [run_analysis.R](./run_analysis.R) are self-contained, and are necessary to download the input datasets, and create the tidy dataset respectively.

Please follow these steps to use the repo effectively:

1. Download and install [RStudio](https://www.rstudio.com/), and set a a working directory.
2. Download or clone this git repo. Make sure that the R scripts end up in the above working directory.
3. Run the command `source("c03-download.R")` from within RStudio to:
   + create `data` directory, if necessary,
   + download the input dataset, if it doesn't exist already, and
   + unzip the datasets to the directory `data/UCI HAR Dataset`, if not already unzipped.
4. Then `source("run_analysis.R")` followed by `run_analysis()` in order to:
   + read activity and variable (column) labels,
   + read and merge train and test observations, including subject and activity columns,
   + extract mean and standard deviation columns,
   + replace activity ID with activity labels,
   + clean up the column names by substituting with descriptive names, and
   + compute averages of the columns grouped by subject Id and activity.
