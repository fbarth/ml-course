dataset <- read.csv("data/breast-cancer-wisconsin.csv")
names(dataset)
dataset$X <- NULL
summary(dataset$diagnosis)
class(dataset$diagnosis)
dataset$id <- NULL
sapply(dataset, class)
