# Getting-and-Cleaning-Data-Course-Project
The purpose of this project is to demonstrate ability to collect, work with, and clean a data set.
We are using data from Human "Activity Recognition Using Smartphones Dataset" [1]

data files:
======================================

- 'features_info.txt': Shows information about the variables used on the feature vector.
- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.

The following file is available for the train and test data. 
- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

script file:
- 'run_analysis.R': 
======================================
    Merges the training and the test sets to create one data set, using 'features.txt' for the column labels
    Extracts only the measurements on the mean and standard deviation for each measurement.
    Uses descriptive activity names to name the activities in the data set
    Adds subject info
    Appropriately labels the data set with descriptive variable names.
    Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
    
result files:
======================================
  TBD

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.


