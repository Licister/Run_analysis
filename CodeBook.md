# Code Book

##1. Original dataset

There are six activities performed by 30 people wearing a Samsung Galaxy S II on the waist. It captures 3-axial linear acceleration and angular velocity. Features are normalized and bounded within [-1,1]. You can check the "features_info.txt" and "README.txt" files in the original data for more information on how the data was collected.

## 2. Raw data

The raw data contains several files. The subjects are divided in two groups (test and train), each with its own file. For each group there are three relevant tables: one for the number of the subject, one for the number of the activity, and one for the values of all the measured features. Apart from these two groups. there are also two other necessary tables: the one with the activity labels and the one with the features/column names. In total, there are 8 different files containing relevant data. Joining together all this data will return a dataframe with 10299 rows by 563 columns.

The features' names contain illegal characters, duplicate names and some other minor issues, such as upper case letters and repeated words.

## 3. Tidy data

To join together both train and test rows, `rbind` was used separately for the subjects, activity and features. These were all put together in the respective dataset in the following order: test, train. The activity values were changed from the numbers 1 to 6 to the lower case values of the activity names, and the underscores were replaced with dots:
 * 1 = walking
 * 2 = walking.upstairs
 * 3 = walking.downstairs
 * 4 = sitting
 * 5 = standing
 * 6 = laying
 
These 3 datasets were then put together using `cbind`. All variable names have been converted to lower caps, invalid characters were removed and underscores were replaced with dots, since it's faster to type a dot than an underscore. The variables that included "bodybody" now only have one "body".
The basic pattern for a variable name is [letter representing time(t) or frequency(f)][feature][.mean or .std][.x, .y or .z if the feature has those alternatives]. For example, for "time", "bodyacc", "mean" and "x", the variable name is "tbodyacc.mean.x". For "frequency", "bodygyromag", "std" with no X, Y or Z, the variable name is "fbodygyromag.std".

The dataset is then converted to a data tbl using the dplyr package. The columns "subject", "activity", and the ones referring to the mean and standard deviation are selected, while excluding the ones about angles and mean frequencies. Afterwards, the dataset is first grouped by the activity name and only then by subject, and the average for each of the other columns is calculated.

The final dataset contains 180 rows, since there are 30 subjects doing 6 activities (30 x 6 = 180). It contains 68 columns: one for the activity name, one for the subject number and one for each variable about a mean or standard deviation.


## 4. Variables

The names of the variables are preceded with the column number. The ones beginning with "t" refer to "time" and the ones beginning with "f" refer to "frequency". The ones with ".mean" refer to means and the ones with ".std" refer to standard deviations. The ones ending in ".x", ".y" or ".z" refer to the specified axis (X, Y or Z). As mentioned before, the basic pattern for a variable name is [letter representing time(t) or frequency(f)][feature][.mean or .std][.x, .y or .z if the feature has those alternatives]. For example, for "time", "bodyacc", "mean" and "x", the variable name is "tbodyacc.mean.x". For "frequency", "bodygyromag", "std" with no X, Y or Z, the variable name is "fbodygyromag.std".

**1: "activity":** The activity being recorded. The observations can assume the following values:
 * walking
 * walking.upstairs
 * walking.downstairs
 * sitting
 * standing
 * laying

**2: "subject":** The subject performing the activity.
 * Values go from 1 to 30.
 
Other variables, grouped by the main feature name:
 
**"bodyacc":* body acceleration signals. The variable name can assume the following combinations:
* 3: "tbodyacc.mean.x"
* 4: "tbodyacc.mean.y"
* 5: "tbodyacc.mean.z"
* 23: "fbodyacc.mean.x"
* 24: "fbodyacc.mean.y"
* 25: "fbodyacc.mean.z"
* 36: "tbodyacc.std.x"
* 37: "tbodyacc.std.y"
* 38: "tbodyacc.std.z"
* 56: "fbodyacc.std.x"
* 57: "fbodyacc.std.y"
* 58: "fbodyacc.std.z"


**"gravityacc":** gravity acceleration signals. The variable name can assume the following combinations:
* 6: "tgravityacc.mean.x"
* 7: "tgravityacc.mean.y"
* 8: "tgravityacc.mean.Z"
* 39: "tgravityacc.std.x"
* 40: "tgravityacc.std.y"
* 41: "tgravityacc.std.z"
 
**"bodyaccjerk":** body acceleration jerk signals. The variable name can assume the following combinations:
* 9: "tbodyaccjerk.mean.x"
* 10: "tbodyaccjerk.mean.y"
* 11: "tbodyaccjerk.mean.z"
* 26: "fbodyaccjerk.mean.x"   
* 27: "fbodyaccjerk.mean.y"  
* 28: "fbodyaccjerk.mean.z"
* 42: "tbodyaccjerk.std.x"   
* 43: "tbodyaccjerk.std.y"
* 44: "tbodyaccjerk.std.z"
* 59: "fbodyaccjerk.std.x"    
* 60: "fbodyaccjerk.std.y"   
* 61: "fbodyaccjerk.std.z"
      
**"bodygyro":** readings from the gyroscope. The variable name can assume the following combinations:
* 12: "tbodygyro.mean.x"
* 13: "tbodygyro.mean.y"
* 14: "tbodygyro.mean.z"
* 29: "fbodygyro.mean.x"
* 30: "fbodygyro.mean.y"
* 31: "fbodygyro.mean.z"
* 45: "tbodygyro.std.x"
* 46: "tbodygyro.std.y"
* 47: "tbodygyro.std.z"
* 62: "fbodygyro.std.x"
* 63: "fbodygyro.std.y"
* 64: "fbodygyro.std.z"
      
**"bodygyrojerk":** readings from the gyroscope jerk signals. The variable name can assume the following combinations:
* 15: "tbodygyrojerk.mean.x"
* 16: "tbodygyrojerk.mean.y"  
* 17: "tbodygyrojerk.mean.z"
* 48: "tbodygyrojerk.std.x"
* 49: "tbodygyrojerk.std.y"
* 50: "tbodygyrojerk.std.z"
      
**"bodyaccmag":** body acceleration magnitude. The variable name can assume the following combinations:
* 18: "tbodyaccmag.mean"
* 32: "fbodyaccmag.mean"
* 51: "tbodyaccmag.std"
* 65: "fbodyaccmag.std"
     
**"gravityaccmag":** gravity acceleration magnitude. The variable name can assume the following combinations:
* 19: "tgravityaccmag.mean"
* 52: "tgravityaccmag.std"
      
**"bodyaccjerkmag":** body acceleration jerk signal magnitude. The variable name can assume the following combinations:
* 20: "tbodyaccjerkmag.mean"
* 33: "fbodyaccjerkmag.mean"
* 53: "tbodyaccjerkmag.std"
* 66: "fbodyaccjerkmag.std"
      
**"bodygyromag":** gyroscope readings magnitude. The variable name can assume the following combinations:
* 21: "tbodygyromag.mean"
* 34: "fbodygyromag.mean"
* 54: "tbodygyromag.std"
* 67: "fbodygyromag.std"
      
**"bodygyrojerkmag":** gyroscope jerk signal readings magnitude. The variable name can assume the following combinations:
* 22: "tbodygyrojerkmag.mean"
* 35: "fbodygyrojerkmag.mean"
* 55: "tbodygyrojerkmag.std"
* 68: "fbodygyrojerkmag.std"
