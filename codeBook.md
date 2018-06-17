# Code Book for Processing Human Activity Data
This code book contains information on processing of Human Activity Recognition data for the *Getting And Cleaning Data* course project.
1. The section titled [Data]() describes the input and output datasets,
2. The section titled [Variables]() describes the observed quantities founds in the columns of the output dataset, and
3. The section titled [Transformations]() details the steps involved in going from input to output dataset.

Please refer to [README.md](./README.md) in this repo for a description of the R scripts used in this project, and how they are connected.

## Data
### Input Dataset
Human Activity Recognition data from the following link is the input dataset for this work:

<https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>.

The input data is divided into training and test sets, which in turn contain 3 sets of data, namely, subjects, activities and observations of the activities. For a more detailed description, please refer to the README.txt file contained therein, and

<http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones>.

### Output Dataset
The output data [tidyDataSet.txt](./tidyDataSet.txt) found in the repo contains averages of the variables grouped by subject ID and activity type. There are 180 rows (30 subjects times 6 activities), and 81 columns (subject ID, activity, followed by 79 mean and standard deviations). The variables are described below.

## Variables

The variables are described along with their column Ids. All observations for these variables represent the average in each category.

Time domain mean and standard deviation for body and gravity acceleration in each direction are given by these variables:
```
 [3] TimeDomainBodyAccelerometerMeanX                              
 [4] TimeDomainBodyAccelerometerMeanY                              
 [5] TimeDomainBodyAccelerometerMeanZ                              
 [6] TimeDomainBodyAccelerometerStandardDeviationX                 
 [7] TimeDomainBodyAccelerometerStandardDeviationY                 
 [8] TimeDomainBodyAccelerometerStandardDeviationZ  
 [9] TimeDomainGravityAccelerometerMeanX                           
[10] TimeDomainGravityAccelerometerMeanY                           
[11] TimeDomainGravityAccelerometerMeanZ                           
[12] TimeDomainGravityAccelerometerStandardDeviationX              
[13] TimeDomainGravityAccelerometerStandardDeviationY              
[14] TimeDomainGravityAccelerometerStandardDeviationZ              
```
Time domain mean and standard deviation for body jerk (time derivative of linear acceleration) in each direction are given by these variables:
```
[15] TimeDomainBodyAccelerometerJerkMeanX                          
[16] TimeDomainBodyAccelerometerJerkMeanY                          
[17] TimeDomainBodyAccelerometerJerkMeanZ                          
[18] TimeDomainBodyAccelerometerJerkStandardDeviationX             
[19] TimeDomainBodyAccelerometerJerkStandardDeviationY             
[20] TimeDomainBodyAccelerometerJerkStandardDeviationZ   
```
Time domain mean and standard deviation for body angular acceleration and angular jerk (time derivative of angular acceleration) in each direction are given by these variables:
```
[21] TimeDomainBodyGyroscopeMeanX                                  
[22] TimeDomainBodyGyroscopeMeanY                                  
[23] TimeDomainBodyGyroscopeMeanZ                                  
[24] TimeDomainBodyGyroscopeStandardDeviationX                     
[25] TimeDomainBodyGyroscopeStandardDeviationY                     
[26] TimeDomainBodyGyroscopeStandardDeviationZ                     
[27] TimeDomainBodyGyroscopeJerkMeanX                              
[28] TimeDomainBodyGyroscopeJerkMeanY                              
[29] TimeDomainBodyGyroscopeJerkMeanZ                              
[30] TimeDomainBodyGyroscopeJerkStandardDeviationX                 
[31] TimeDomainBodyGyroscopeJerkStandardDeviationY                 
[32] TimeDomainBodyGyroscopeJerkStandardDeviationZ  
```
The time domain mean and standard deviation of magnitude of body acceleration, gravity acceleration, body jerk, body angular acceleration, and body angular jerk are given by these variables:
```
[33] TimeDomainBodyAccelerometerMagnitudeMean                      
[34] TimeDomainBodyAccelerometerMagnitudeStandardDeviation         
[35] TimeDomainGravityAccelerometerMagnitudeMean                   
[36] TimeDomainGravityAccelerometerMagnitudeStandardDeviation      
[37] TimeDomainBodyAccelerometerJerkMagnitudeMean                  
[38] TimeDomainBodyAccelerometerJerkMagnitudeStandardDeviation     
[39] TimeDomainBodyGyroscopeMagnitudeMean                          
[40] TimeDomainBodyGyroscopeMagnitudeStandardDeviation             
[41] TimeDomainBodyGyroscopeJerkMagnitudeMean                      
[42] TimeDomainBodyGyroscopeJerkMagnitudeStandardDeviation         
```
The frequency domain mean and standard deviation of body acceleration in each direction are given by these variables:
```
[43] FrequencyDomainBodyAccelerometerMeanX                         
[44] FrequencyDomainBodyAccelerometerMeanY                         
[45] FrequencyDomainBodyAccelerometerMeanZ                         
[46] FrequencyDomainBodyAccelerometerStandardDeviationX            
[47] FrequencyDomainBodyAccelerometerStandardDeviationY            
[48] FrequencyDomainBodyAccelerometerStandardDeviationZ            
```
The mean of frequency weighted body acceleration in each direction are given by these variables:
```
[49] FrequencyDomainBodyAccelerometerMeanFreqX                     
[50] FrequencyDomainBodyAccelerometerMeanFreqY                     
[51] FrequencyDomainBodyAccelerometerMeanFreqZ
```
The frequency domain mean and standard deviation of body jerk in each direction are given by these variables:
```
[52] FrequencyDomainBodyAccelerometerJerkMeanX                     
[53] FrequencyDomainBodyAccelerometerJerkMeanY                     
[54] FrequencyDomainBodyAccelerometerJerkMeanZ                     
[55] FrequencyDomainBodyAccelerometerJerkStandardDeviationX        
[56] FrequencyDomainBodyAccelerometerJerkStandardDeviationY        
[57] FrequencyDomainBodyAccelerometerJerkStandardDeviationZ        
```
The mean of frequency weighted body jerk in each direction are given by these variables:
```
[58] FrequencyDomainBodyAccelerometerJerkMeanFreqX                 
[59] FrequencyDomainBodyAccelerometerJerkMeanFreqY                 
[60] FrequencyDomainBodyAccelerometerJerkMeanFreqZ                 
```
The frequency domain mean and standard deviation of body angular acceleration in each direction are given by these variables:
```
[61] FrequencyDomainBodyGyroscopeMeanX                             
[62] FrequencyDomainBodyGyroscopeMeanY                             
[63] FrequencyDomainBodyGyroscopeMeanZ                             
[64] FrequencyDomainBodyGyroscopeStandardDeviationX                
[65] FrequencyDomainBodyGyroscopeStandardDeviationY                
[66] FrequencyDomainBodyGyroscopeStandardDeviationZ                
```
The mean of frequency weighted body angular acceleration in each direction are given by these variables:
```
[67] FrequencyDomainBodyGyroscopeMeanFreqX                         
[68] FrequencyDomainBodyGyroscopeMeanFreqY                         
[69] FrequencyDomainBodyGyroscopeMeanFreqZ                         
```
The frequency domain mean, standard deviation and weighted frequency mean of magnitude of body acceleration, body jerk, body angular acceleration, and body angular jerk are given by these variables:
```
[70] FrequencyDomainBodyAccelerometerMagnitudeMean                 
[71] FrequencyDomainBodyAccelerometerMagnitudeStandardDeviation    
[72] FrequencyDomainBodyAccelerometerMagnitudeMeanFreq             
[73] FrequencyDomainBodyAccelerometerJerkMagnitudeMean             
[74] FrequencyDomainBodyAccelerometerJerkMagnitudeStandardDeviation
[75] FrequencyDomainBodyAccelerometerJerkMagnitudeMeanFreq         
[76] FrequencyDomainBodyGyroscopeMagnitudeMean                     
[77] FrequencyDomainBodyGyroscopeMagnitudeStandardDeviation        
[78] FrequencyDomainBodyGyroscopeMagnitudeMeanFreq                 
[79] FrequencyDomainBodyGyroscopeJerkMagnitudeMean                 
[80] FrequencyDomainBodyGyroscopeJerkMagnitudeStandardDeviation    
[81] FrequencyDomainBodyGyroscopeJerkMagnitudeMeanFreq             
```

## Transformations
All file references in this section are with respect to the R studio working directory `./data/UCI HAR Dataset`. After examining the unzipped files, the R script was written to affect the following transformations:

 * Activity and feature labels (measured/computed quantities) were found in `activity_labels.txt` and `features.txt`, respectively. These were read into two data frames.
 * Subject Id, activity Id and the observations for "training" datasets were found in `train/subject_train.txt`, `train/y_train.txt`, and `train/X_train.txt` respectively. These 3 datasets were column bound into a single training dataset.
 * Similar test dataset was created from the contents of `test` directory. Then this dataset was row bound to the training dataset above. Finally column names were added from the feature labels.
 * Then the mean and standard deviation quantities were extracted out (by searching on `mean` and `std`) into its own dataset. At this stage the original training dataset was deleted in order to conserve memory and improve performance.
 * The activity Ids were replaced with the activity labels.
 * Then the column names were changed to be more human readable. Key substitutions were:
   + First letters `f` and `t` with `FrequencyDomain` and `TimeDomain`,
   + `std`, `mean` and `mag` with `StandardDeviation`, `Mean` and `Magnitude`, and
   + Removal of punctuations such as `()-`.
 * Finally a tidy dataset was extracted by grouping the above dataset by subject Id and activity label, and then summarizing the data. The summarized data was written to `tidyDataSet.txt`.