#change directory to the UCI HAR Dataset folder
setwd("./UCI HAR Dataset")

#load required library
library(dplyr)

#read in the tables
variables <- read.table("features.txt", sep= " ")
labels <- read.table("activity_labels.txt")

subject_test <- read.table("./test/subject_test.txt", col.names="subject")
subject_train <- read.table("./train/subject_train.txt", col.names="subject")

y_test <- read.table("./test/y_test.txt", col.names="activity")
y_train <- read.table("./train/y_train.txt", col.names="activity")

test <- read.table("./test/X_test.txt")
train <- read.table("./train/X_train.txt")

#binding together subject rows and activity rows, in the same order
subject <- rbind(subject_test, subject_train)
activity <- rbind(y_test, y_train)

#change activity names from numbers to the labels
for(i in 1:6) { activity$activity <- sub(i, labels[i, 2], activity$activity)}

#lower case the name of the activities
activity$activity <- tolower(activity$activity)
activity$activity <- sub("_", ".", activity$activity)

#merge all the observations for the remaining variables, in the same order as before
observations <- rbind(test, train)

#make the names of the variables unique and put them as column names
variables <- make.unique(as.character(variables$V2))
names(observations) <- variables

#bind together subject, activity and the other variables
full <- cbind(subject, activity, observations)

#change names of variables
names(full) <- sub("\\()-", "\\.", names(full)) #replace ()- by a dot
names(full) <- sub("\\()$", "", names(full)) #remove () by the end of the line
names(full) <- make.names(names(full)) #changes any remaining non-alphanumerical characters to dots
names(full) <- tolower(names(full)) #lower case all characters
names(full) <- sub("bodybody", "body", names(full)) #removes a "body" when it is repeated

#convert data frame to data tbl, to select, group by and calculate the means easily and faster
analysis <- tbl_df(full) %>%
      select(subject, activity, contains("mean"), contains("std"), -contains("angle"), -contains("meanfreq")) %>%
      group_by(activity, subject) %>%
      summarise_each(funs(mean)) %>%
      group_by(activity, subject)

#converts the data table back to data frame, in case the user prefers to work with a data frame
dataframe <- as.data.frame(analysis)

#print the data tbl to the console
print(analysis)
