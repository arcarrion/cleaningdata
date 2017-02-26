run_analysis <- function() {
  
  #Load activity and feature names from files. They will be used
  #to label activities (y vector), and variables (x columns)
  activitylabels<-read.table("./activity_labels.txt", header = FALSE, stringsAsFactors = FALSE)
  features<-read.table("./features.txt", header=FALSE, stringsAsFactors = FALSE)
  
  #Load train data
  subjecttrain<-read.table("./train/subject_train.txt", header = FALSE)
  #Column names of X data will be the features read from features.txt
  xtrain<-read.table("./train/x_train.txt", header = FALSE, col.names = features$V2)
  ytrain<-read.table("./train/y_train.txt", header = FALSE)
  
  #Load test data
  subjecttest<-read.table("./test/subject_test.txt", header = FALSE)
  #Column names of X data will be the features read from features.txt
  xtest<-read.table("./test/X_test.txt", header = FALSE, col.names = features$V2)
  ytest<-read.table("./test/y_test.txt", header = FALSE)
  
  #1. Merge training and test data for the three sets
  x<-rbind(xtrain,xtest)
  y<-rbind(ytrain,ytest)
  subjects<-rbind(subjecttrain,subjecttest)

  #2. Extract only the measurements (X) on the mean and 
  #standard deviation for each measurement. Since there is no clarification,
  #I opted to consider just those measurements which are "strictly" mean(), i.e., 
  #I have discarded the meanFreq() measurements as I was not sure they should
  #be included. If they should be considered, it would be enough to eliminate the
  #\\(\\) from the code inside the grep function.
  xdata_tbl<-tbl_df(x) %>% 
    select(grep("(mean\\(\\))|(std\\(\\))",features$V2))
  
  #3. Assign descriptive names to the activities (using the activity names 
  #supplied in activity_labels.txt). Factoring the values allows to match
  #the numeric values with the activity name
  yfactored<-factor(y$V1,levels=activitylabels$V1,labels=activitylabels$V2)
  
  #4. Create a complete dataset with values of X, y and subject, with 
  #descriptive variable names. Recall that the X variable names were
  #assigned using the names in the features.txt file during data loading.
  #The select is done to reorder columns, just for ease of viewing regarding
  #the grouping done afterwards
  dataset_tbl<-mutate(xdata_tbl, subject = subjects$V1, activity=yfactored) %>%
    select(activity,subject,everything())
  
  #5. Group by activity and subject (in this order), to calculate the mean of
  #the rest of columns (all mean() and st() measurements in the dataset)
  dataset_tbl%>%group_by(activity,subject)%>%summarise_each(funs(mean))
  
  #Write table to an external file
  write.table(dataset_tbl, "./tidy_dataset.txt", row.names = FALSE)
  
  dataset_tbl
}
  