library(FSelector)
library(randomForest)

# load data
setwd("~/Documents/aulas/coursera/dataAnaylsis/assignments/assignment2")
load("samsungData.rda")

# transform data
names(samsungData) <- gsub("\\)","_",
                           gsub("\\(","_",
                                gsub(",","_",
                                     gsub("-","_",names(samsungData)))))
samsungData$activity <- as.factor(samsungData$activity)

# create training and data sets
train <- subset(samsungData, samsungData$subject < 20)
test <- subset(samsungData, samsungData$subject > 20)
train$subject <- NULL
test$subject <- NULL


