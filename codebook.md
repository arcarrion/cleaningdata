#Course Project Codebook

## Feature Selection and Pre-Processing

As the authors of the original data set (see README.md file) explained:

>The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz.

>Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag).

>Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals).

>These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

* tBodyAcc-XYZ
* tGravityAcc-XYZ
* tBodyAccJerk-XYZ
* tBodyGyro-XYZ
* tBodyGyroJerk-XYZ
* tBodyAccMag
* tGravityAccMag
* tBodyAccJerkMag
* tBodyGyroMag
* tBodyGyroJerkMag
* fBodyAcc-XYZ
* fBodyAccJerk-XYZ
* fBodyGyro-XYZ
* fBodyAccMag
* fBodyAccJerkMag
* fBodyGyroMag
* fBodyGyroJerkMag

## Feature Statistics Selected for the Course Project

>The set of variables that were estimated from these signals are:

* mean(): Mean value
* std(): Standard deviation

This is just a subset of the original data set variables estimated.

## Final Variables for the Course Project

For the course project, the data set is grouped by activity and subject, and the average of
each variable (tBodyAcc.mean...X, tBodyAcc.std...X, tBodyAcc.mean...Y, tBodyAcc.std...y ... tGravityAcc.mean...X,
tGravityAcc.std...X ...) is calculated, thus having observations of the form:

activity | subject | tBodyAcc.mean...X | tBodyAcc.std...X  | ....
---------|---------|-------------------|-------------------|-----
WALKING | 1 | mean(tBodyAcc.mean...X for WALKING for subject 1) | mean(tBodyAcc.std...X for WALKING for subject 1) | ...
WALKING | 2 | mean(tBodyAcc.mean...X for WALKING for subject 2) | mean(tBodyAcc.std...X for WALKING for subject 2) | ...  
 ...    | ... | ... | ... | ...  
WALKING | 30 | mean(tBodyAcc.mean...X for WALKING for subject 30) | mean(tBodyAcc.std...X for WALKING for subject 30) | ...  
WALKING_UPSTAIRS |1 | mean(tBodyAcc.mean...X for WALKING_UPSTAIRS for subject 1) | mean(tBodyAcc.mstd...X for WALKING_UPSTAIRS for subject 1) | ...

The complete list of variables is available in [newfeatures.txt](https://github.com/arcarrion/cleaningdata/blob/master/newfeatures.txt)
