require(data.table)
require(reshape)

# get all column nammes
col_names <- read.table("./UCI HAR Dataset/features.txt")[,2]

# extract indicies of mean and standard deviation columns
col_indicies <- grepl("mean|std", col_names)

# get activity names
# !important: we will use index as activity Id as they are same in our case
activity_names <- read.table("./UCI HAR Dataset/activity_labels.txt")[,2]

# combines x_test, y_test and subjects to one data table
#   data_type: string value 'test' or 'train'
extract_x_y_subject = function (data_type) {
  x_file <- sprintf("./UCI HAR Dataset/%1$s/X_%1$s.txt", data_type)
  y_file <- sprintf("./UCI HAR Dataset/%1$s/y_%1$s.txt", data_type)
  subjs_file <- sprintf("./UCI HAR Dataset/%1$s/subject_%1$s.txt", data_type)
  
  # read X table and extract only columns we need
  data <- read.table(x_file, col.names=col_names)[, col_indicies]
  names(data) <- col_names[col_indicies]
  
  # read Y vector
  activity_ids <- read.table(y_file)[[1]]
  
  # add Y column as names
  data <- cbind(data, activity_names[activity_ids])
  
  # put a nice name
  names(data)[length(names(data))] <- "Activity"
  
  # add subject column
  data <- cbind(data, read.table(subjs_file))
  
  # put a nice name
  names(data)[length(names(data))] <- "Subject.Id"
  
  # return result data set
  data
}

# vertically concatenate train and test data
all_data <- rbind(extract_x_y_subject("test"), train_data <- extract_x_y_subject("train"))

# melt data by Activity and Subject.Id
melten <- melt(all_data, id.vars = c("Activity", "Subject.Id"))

# calculate the average of each variable per each activity and each subject
result_data <- cast(Subject.Id + Activity ~ variable, data = melten, fun = mean)

# save result data
write.table(result_data, "tidy_data.txt", row.name=FALSE)