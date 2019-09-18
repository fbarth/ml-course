#
# knn com dataset madelon
#

normalize <- function(x){
  return ((x - min(x)) / (max(x) - min(x))) 
}

X <- read.csv("data/madelon_train.data", sep=" ")
head(X)
X$X <- NULL
Y <- read.csv("data/madelon_train.labels", sep=" ")
head(Y)
names(Y) <- c("Y")


X_norm <- as.data.frame(lapply(X, normalize))
summary(X_norm)

set.seed(1234)
ind <- sample(3, nrow(X_norm), replace=TRUE, prob=c(0.6, 0.2, 0.2))

training <- X_norm[ind==1,]
test <- X_norm[ind==2,]
validation <- X_norm[ind==3,]

training.Y <- Y[ind==1,]
test.Y <- Y[ind==2,]
validation.Y <- Y[ind==3,]

library(class)
library(caret)

pred <- knn(train = training, test = test, cl = training.Y, k=1)
t <- table(pred, test.Y)
confusionMatrix(t)

pred <- knn(train = training, test = test, cl = training.Y, k=3)
t <- table(pred, test.Y)
confusionMatrix(t)

pred <- knn(train = training, test = test, cl = training.Y, k=34)
t <- table(pred, test.Y)
confusionMatrix(t)

result <- data.frame(k=integer(), accr=integer())
for (i in 1:100){
  pred <- knn(train = training, test = test, cl = training.Y, k=i)
  accr <- confusionMatrix(table(pred, test.Y))$overall[1]
  result <- rbind(result, c(i,accr))
  print(paste(i,"  ",accr))
}
names(result) <- c('k','accr')
plot(result$accr ~   result$k, type='l')
