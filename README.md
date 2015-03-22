# Getting and Cleaning Data
## Project descirption
The purpose of this project is to demonstrate my ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis.

### Repository structure
* **README.md** - repository description file you are reading now
* **run_analysis.R** - the script for performing the analysis
* **CodeBook.md** - a code book that describes the variables, the data, and all transformations that has been performed to clean up the data

### run_analysis.R does the following
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

### Dependencies
run_analysis.R depends on following packages - **data.table**, **reshape** and requires **Human Activity Recognition Using Smartphones Data Set** placed in _.\UCI HAR Dataset_ folder