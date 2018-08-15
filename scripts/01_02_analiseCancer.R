#
# O objetivo deste script é discutir os conceitos de 
# overfit e underfit através de um problema para
# identificação de cancer benigno e maligno
#

dataset <- read.csv("data/breast-cancer-wisconsin.csv")
dataset$X <- NULL
dataset$id <- NULL

library(caret)
set.seed(1234)
trainIndex <- createDataPartition(dataset$diagnosis, p = .8,
                                  list = FALSE,
                                  times = 1)
train <- dataset[trainIndex,]
test <- dataset[-trainIndex,]

# criando um modelo com arvores de decisao com todos os exemplos
library(party)
myFormula <- diagnosis ~ .
cancer_ctree <- ctree(myFormula, data=train)

trainPred <- predict(cancer_ctree, newdata = train)
t <- table(trainPred, train$diagnosis)
confusionMatrix(t)

testPred <- predict(cancer_ctree, newdata = test)
t2 <- table(testPred, test$diagnosis)
confusionMatrix(t2)

# apenas com 4 atributos: exemplo de overfit
myFormula <- diagnosis ~ radius_mean + texture_mean + perimeter_mean + area_mean
cancer_ctree <- ctree(myFormula, data=train)

trainPred <- predict(cancer_ctree, newdata = train)
t <- table(trainPred, train$diagnosis)
confusionMatrix(t)

testPred <- predict(cancer_ctree, newdata = test)
t2 <- table(testPred, test$diagnosis)
confusionMatrix(t2)

#
# variando o numero de exemplos no conjunto de treinamento
# 

myFormula <- diagnosis ~ .
result <- matrix(0,nrow=nrow(train), ncol=2)
for (i in 10:nrow(train)){
  
  train_temp <- train[1:i,]
  cancer_ctree <- ctree(myFormula, data=train_temp)
  trainPred <- predict(cancer_ctree, newdata = train_temp)
  t <- table(trainPred, train_temp$diagnosis)
  
  testPred <- predict(cancer_ctree, newdata = test)
  t2 <- table(testPred, test$diagnosis)
  
  print(paste(i,"  ",(confusionMatrix(t))$overall[1],"  ",(confusionMatrix(t2))$overall[1]))
  result[i,] <- c((confusionMatrix(t))$overall[1], (confusionMatrix(t2))$overall[1])
} 
result <- result[10:nrow(result), ]

plot(result[,1], type="l", col="red", ylim=c(0,1), 
     xlab="# exemplos", ylab="accr", main="Exemplo de overfit considerando N exemplos")
lines(result[,2], type="l", col="blue")
legend("bottomright", inset = 0.15, title="Dataset",
       c("Train","Test"), fill=c("red","blue"), horiz=FALSE)


#
# variando o numero de atributos no conjunto de treinamento
# 

myFormula <- diagnosis ~ .
result <- matrix(0,nrow=ncol(train), ncol=2)
for (i in 2:ncol(train)){
  train_temp <- train[,1:i]
  cancer_ctree <- ctree(myFormula, data=train_temp)
  trainPred <- predict(cancer_ctree, newdata = train_temp)
  t <- table(trainPred, train_temp$diagnosis)
  
  testPred <- predict(cancer_ctree, newdata = test)
  t2 <- table(testPred, test$diagnosis)
  
  print(paste(i,"  ",(confusionMatrix(t))$overall[1],"  ",(confusionMatrix(t2))$overall[1]))
  result[i,] <- c((confusionMatrix(t))$overall[1], (confusionMatrix(t2))$overall[1])
} 

plot(result[2:ncol(train),1], type="l", col="red", ylim=c(0,1), 
     xlab="# exemplos", ylab="accr", main="Exemplo de overfit considerando N atributos")
lines(result[2:ncol(train),2], type="l", col="blue")
legend("bottomright", inset = 0.15, title="Dataset",
       c("Train","Test"), fill=c("red","blue"), horiz=FALSE)


#
# variando o numero de exemplos no conjunto de treinamento, mas usando RandomForest ao inves
# de arvore de decisao
# 

library(randomForest)
myFormula <- diagnosis ~ .
result <- matrix(0,nrow=nrow(train), ncol=2)
for (i in 21:nrow(train)){
  
  train_temp <- train[1:i,]
  cancer_ctree <- randomForest(myFormula, data=train_temp)
  trainPred <- predict(cancer_ctree, newdata = train_temp)
  t <- table(trainPred, train_temp$diagnosis)
  
  testPred <- predict(cancer_ctree, newdata = test)
  t2 <- table(testPred, test$diagnosis)
  
  print(paste(i,"  ",(confusionMatrix(t))$overall[1],"  ",(confusionMatrix(t2))$overall[1]))
  result[i,] <- c((confusionMatrix(t))$overall[1], (confusionMatrix(t2))$overall[1])
} 
result <- result[21:nrow(result), ]

plot(result[,1], type="l", col="red", ylim=c(0,1), 
     xlab="# exemplos", ylab="accr", main="Exemplo de overfit considerando N exemplos")
lines(result[,2], type="l", col="blue")
legend("bottomright", inset = 0.15, title="Dataset",
       c("Train","Test"), fill=c("red","blue"), horiz=FALSE)

