############
##Course Project: Getting and Cleaning Data

##Set Working Directory
wkdir <- "C:/Users/amile_000/Documents/Getting and Cleaning Data/GetCleanDataProject"
setwd(wkdir)

##Load Dependencies
if (!require("data.table")) {
    install.packages("data.table")
}

require(data.table)


############
##1. Merge the training and the test sets to create one data set

#Read in Test Data
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt", header=F)
x_test <- read.table("./UCI HAR Dataset/test/X_test.txt", header=F)
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt", header=F)

#Read in Train Data
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt", header=F)
x_train <- read.table("./UCI HAR Dataset/train/X_train.txt", header=F)
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt", header=F)

#Label Subjects Column
names(subject_train) <- "subjectID"
names(subject_test) <- "subjectID"



############
##4. Appropriately labels the data set with descriptive variable names.
names <- read.table("./UCI HAR Dataset/features.txt", header=F)
names(x_train) <- names$V2
names(x_test) <- names$V2



###############
##1. Continued

#Label Y (activity) column
names(y_train) <- "activity"
names(y_test) <- "activity"

#Bind together
train <- cbind(subject_train, y_train, x_train)
test <- cbind(subject_test, y_test, x_test)
dat <- rbind(train, test)



############
##2. Extract only mean and s.d on measurements taken

#Get columns with means and sd measurements
meansd_cols <- grep(".*mean.*|.*std.*", names(dat), ignore.case=TRUE)

#Add activity type (Y) and subject id to required columns
required_cols <- c(1, 2, meansd_cols)

#Keep only relevant columns
dat <- dat[, required_cols]



############
##3. Uses descriptive activity names to name the activities in the data set
dat$activity <- factor(dat$activity, labels=c("Walking", "Walking Upstairs", 
                                                        "Walking Downstairs", "Sitting", 
                                                        "Standing", "Laying"))


############
##5.creates a second, independent tidy data set with the
##average of each variable for each activity and each subject

#Set Subject to be factor variable
dat$subjectID <- as.factor(dat$subjectID)

#Create Tidy Dataset
tidyData <- aggregate(. ~ subjectID + activity, data=dat, mean)

#Order Datset
tidyData <- tidyData[order(tidyData$subjectID, tidyData$activity),]

#Write Dataset
write.table(tidyData, file="./tidyData.txt", row.names = F)

