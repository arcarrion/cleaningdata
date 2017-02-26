# Getting and Cleaning Data Course Project

## Original Data Set information

The original data used for the course project is taken from the Human Activity Recognition Using Smartphones Dataset, Version 1.0, by Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto, from Smartlab - Non Linear Complex Systems Laboratory
DITEN - Universit� degli Studi di Genova ([activityrecognition@smartlab.ws](activityrecognition@smartlab.ws))

As the authors explain:
> The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

> The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details.

> For each record it is provided:

 * Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration, normalized to [-1, 1].
 * Triaxial Angular velocity from the gyroscope, normalized to [-1, 1].
 * Its activity label, taking values 1 to 6 corresponding to {WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING}.
 * An identifier of the subject who carried out the experiment, ranging from 1 to 30

The original dataset includes the following files:

* 'README.txt'
* 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample.
* 'features_info.txt': Shows information about the variables used on the feature vector.
* 'features.txt': List of all features.
* 'activity_labels.txt': Links the class labels with their activity name.
* 'train/X_train.txt': Training variable set.
* 'train/y_train.txt': Training activity labels.
* 'test/X_test.txt': Test variable set.
* 'test/y_test.txt': Test activity labels.

For the course project, four files were added:

* README.md
* newfeatures.txt: names of the features considered in the project (a subset of features.txt).
* run_analysis.R: R script with all the processing required for the project.
* tidy_dataset.txt: resulting tidy data set of the run_analysis R script.

## Feature Selection and Pre-Processing

As the authors of the original data set explained:

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

This is just a subset of the original variables estimated.

### Final Variables for the Course Project

For the course project, the data set is grouped by activity and subject, and the average of
each variable (tBodyAcc-XYZ-mean, tBodyAcc-XYZ-std, tGravityAcc-XYZ-mean,
tGravityAcc-XYZ-std...) is calculated, thus having observations of the form:


activity | subject | tBodyAcc-XYZ-mean | tBodyAcc-XYZ-std  | ....
---------|---------|-------------------|-------------------|-----
WALKING | 1 | mean(tBodyAcc-XYZ-mean for WALKING for subject 1) | mean(tBodyAcc-XYZ-std for WALKING for subject 1) | ...
WALKING | 2 | mean(tBodyAcc-XYZ-mean for WALKING for subject 2) | mean(tBodyAcc-XYZ-std for WALKING for subject 2) | ...  
 ...    | ... | ... | ... | ...  
WALKING | 30 | mean(tBodyAcc-XYZ-mean for WALKING for subject 30) | mean(tBodyAcc-XYZ-std for WALKING for subject 30) | ...  
WALKING_UPSTAIRS |1 | mean(tBodyAcc-XYZ-mean for WALKING_UPSTAIRS for subject 1) | mean(tBodyAcc-XYZ-std for WALKING_UPSTAIRS for subject 1) | ...

The complete list of variables is available in [newfeatures.txt](https://github.com/arcarrion/cleaningdata/blob/master/newfeatures.txt)
