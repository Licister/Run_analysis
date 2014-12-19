This code runs an analysis on the "Human Activity Recognition Using Smartphones Dataset", version 1.0. To check the original dataset, download the file at [this link](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip). [1]


The analysis creates a readable dataset that includes the average of all the variables about means or standard deviations.

### To open the dataset properly:
 * Open with `read.table("analysis.txt", header = TRUE, sep = " ")`.
The table should be a data frame. To convert to a data tbl, which is the original form of this table:
 * Store the table: for example, `analysis <- read.table("analysis.txt", header=TRUE, sep= " ")`;
 * Convert to data tbl: `analysis <- tbl_df(analysis)`.

### To run the script properly:
 * The file must be placed in the same directory as the "UCI HAR Dataset";
 * The user should have the dplyr package installed. To install, run `install.packages("dplyr")`;
 * To open with R, set the working directory to the one containing the "UCI HAR Dataset";
 * Run `source("run_analysis.R")`.

The final dataset is stored with the name "analysis" and is a data tbl. Some useful functions to see more about the data are `select()` and `filter`. 
If you prefer to use a data frame, the "analysis" data tbl has been converted to a data frame with the name "dataframe".

The dataset "analysis" contains 180 rows, each for a combination of users(30) and activities(6). It contains 68 columns, the first two being "activity" and "subject", and the remaining are the relevant variables.
 

First, all the necessary tables are read into R. They are then bound together using `rbind` for each of the sets individually (one for the subject, one for the activity and one for the remaining variables). 
After this, the sets are bound together using `cbind`. All the illegal variable names are replaced before converting the data frame to a data tbl. 
The data tbl is then reduced to contain only the variables "activity", "subject", and the ones related to mean and standard deviation, excluding angles and mean frequencies. 
The data tbl is grouped by "activity" and "subject", and the average of the remaining variables is calculated taking into account these two groups.

The dataset is first grouped by the activity name and only then by subject because the activity is the main variable: the activity is being recorded, the subject does the activity being recorded.


[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012