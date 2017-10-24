setwd("C:/Users/Patrick/Documents/R/data-cleaning/project/UCI HAR Dataset")

library(data.table); library(dplyr)

# read features list
features <- read.csv("features.txt", sep=" ", header=FALSE)
# read training and test sets as fixed width files
train <- read.fwf("train/X_train.txt", rep(16,561))
test <- read.fwf("test/X_test.txt", rep(16,561))
# merge training and test
full <- rbindlist(list(train, test))
# rename columns
colnames(full) <- as.character(features$V2)
# select columns containing mean() or std()
full <- subset(full, select = 
                 grep("mean\\(\\)|std\\(\\)", names(full), value=TRUE))

# read training and test labels as fixed width files and merge
ytrain <- read.fwf("train/y_train.txt", 1)
ytest <- read.fwf("test/y_test.txt", 1)
yfull <- rbindlist(list(ytrain, ytest))

# create descriptive activity labels 
alabels <- c("walking", "walkingupstairs","walkingdownstairs",
  "sitting", "standing", "laying")
# add activity labels to data
yfull <- apply(yfull, 2, function(x){alabels[x]})
full$activity <- yfull
full$activity = as.factor(full$activity)

# read training and test subject info as fixed width files and merge
subjecttrain <- read.csv("train/subject_train.txt", header=FALSE)
subjecttest <- read.csv("test/subject_test.txt", header=FALSE)
subjectfull <- rbindlist(list(subjecttrain, subjecttest))

full$subject = subjectfull
full$subject=as.factor(full$subject)

# move last two columns to first two for legibility
full <- full[,c(ncol(full),ncol(full)-1, 1:(ncol(full)-2)), with=FALSE]

# create more descriptive variable names
names(full)
descnames <- names(full) %>%
  gsub("^f", "frequency", .) %>%
  gsub("^t", "time", .) %>%
  gsub("\\(\\)", "", .) %>%
  gsub("Acc", "accelerometer", .) %>%
  gsub("Gyro", "gyroscope", .)

names(full) <- descnames
View(full)

# create a  data set with the average of each variable for each activity and each subject.
fullsummary <- full %>%
  group_by(activity, subject) %>% 
  summarise_all(funs(mean))
View(fullsummary)
