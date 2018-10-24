#
# knn com dataset iris
#

normalize <- function(x){
  return ((x - min(x)) / (max(x) - min(x))) 
}

data(iris)
iris_norm <- as.data.frame(lapply(iris[1:4], normalize))
summary(iris_norm)

set.seed(1234)
ind <- sample(2, nrow(iris), replace=TRUE, prob=c(0.67, 0.33))

iris.training <- iris_norm[ind==1, 1:4]
iris.test <- iris_norm[ind==2, 1:4]
iris.trainLabels <- iris[ind==1, 5]
iris.testLabels <- iris[ind==2, 5]

library(class)

iris_pred <- knn(train = iris.training, test = iris.test, cl = iris.trainLabels, k=1)
t <- table(iris_pred, iris.testLabels)
t

iris_pred <- knn(train = iris.training, test = iris.test, cl = iris.trainLabels, k=2)
t <- table(iris_pred, iris.testLabels)
t

iris_pred <- knn(train = iris.training, test = iris.test, cl = iris.trainLabels, k=3)
t <- table(iris_pred, iris.testLabels)
t

iris_pred <- knn(train = iris.training, test = iris.test, cl = iris.trainLabels, k=5)
t <- table(iris_pred, iris.testLabels)
t
