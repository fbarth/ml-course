#
# Trabalhando com um dataset com alta dimensionalidade,
# de separação não linear em um problema de classificacao
#

X <- read.csv("data/madelon_train.data", sep=" ")
head(X)
X$X <- NULL
Y <- read.csv("data/madelon_train.labels", sep=" ")
head(Y)
names(Y) <- c("Y")

dataset <- cbind(Y, X)
head(dataset)
class(dataset$Y)
dataset$Y <- as.factor(dataset$Y)
class(dataset$Y)

table(dataset$Y)
set.seed(1234)
trainIndex <- createDataPartition(dataset$Y, p = .8,
                                  list = FALSE,
                                  times = 1)
train <- dataset[trainIndex,]
test <- dataset[-trainIndex,]
train <- train[sample(nrow(train)),]
test <- test[sample(nrow(test)),]

#
# criando modelo com ctree
#

library(party)
myFormula <- Y ~ .
result <- data.frame(i=integer(), trainAccr=integer(), testAccr=integer())
for (i in 10:nrow(train)){
  if(!i%%100){
    train_temp <- train[1:i,]
    model_ctree <- ctree(myFormula, data=train_temp)
    trainPred <- predict(model_ctree, newdata = train_temp)
    t <- table(trainPred, train_temp$Y)
    
    testPred <- predict(model_ctree, newdata = test)
    t2 <- table(testPred, test$Y)
    
    print(paste(i,"  ",(confusionMatrix(t))$overall[1],"  ",(confusionMatrix(t2))$overall[1]))
    result <- rbind(result, c(i, (confusionMatrix(t))$overall[1], (confusionMatrix(t2))$overall[1]))
  }
} 
names(result) <- c('i','trainAccr','testAccr')
plot(result$trainAccr ~ result$i, type='l', col='red', 
     main="Curva de aprendizado para o problema Madelon usando ctree", ylim=c(0,1))
lines(result$testAccr ~ result$i, type='l', col='blue')

legend("bottomright", inset = 0.15, title="Dataset",
       c("Train","Test"), fill=c("red","blue"), horiz=FALSE)

#
# criando modelo com Random Forest
#

library(randomForest)
myFormula <- Y ~ .
resultRF <- data.frame(i=integer(), OOB=integer(), trainAccr=integer(), testAccr=integer())
for (i in 10:nrow(train)){
  if(!i%%100){
    train_temp <- train[1:i,]
    modelRF <- randomForest(myFormula, data=train_temp)
    
    t0 <- (1 - modelRF$err.rate[nrow(modelRF$err.rate),1])
    
    trainPred <- predict(modelRF, newdata = train_temp)
    t <- table(trainPred, train_temp$Y)
    
    testPred <- predict(modelRF, newdata = test)
    t2 <- table(testPred, test$Y)
    
    print(paste(i,"  ",t0,"  ",(confusionMatrix(t))$overall[1],"  ",(confusionMatrix(t2))$overall[1]))
    resultRF <- rbind(resultRF, c(i, t0, (confusionMatrix(t))$overall[1], (confusionMatrix(t2))$overall[1]))
  }
} 
names(resultRF) <- c('i','OOB','trainAccr','testAccr')
plot(resultRF$trainAccr ~ resultRF$i, type='l', col='red', 
     main="Curva de aprendizado para o problema Madelon usando Random Forest", ylim=c(0,1))
lines(resultRF$testAccr ~ resultRF$i, type='l', col='blue')
lines(resultRF$OOB ~ resultRF$i, type='l', col='cyan')

legend("bottomright", inset = 0.15, title="Dataset",
       c("Train","Test","OOB"), fill=c("red","blue","cyan"), horiz=FALSE)

result[nrow(result),c('testAccr')]
resultRF[nrow(resultRF),c('testAccr')]

#
# Prova que nao adianta tornar o modelo mais complexo
#
library(party)
myFormula <- Y ~ .
newModel <- randomForest(myFormula, data=train, do.trace=100, ntree=1000, importance = TRUE)
confusionMatrix(table(predict(newModel, newdata=train), train$Y))$overall[1]
confusionMatrix(table(predict(newModel, newdata=test), test$Y))$overall[1]

#
# aumentando o numero de atributos que devem ser escolhidos
#
newModel <- randomForest(myFormula, data=train, do.trace=100, importance = TRUE, mtry = 200)
confusionMatrix(table(predict(newModel, newdata=train), train$Y))$overall[1]
confusionMatrix(table(predict(newModel, newdata=test), test$Y))$overall[1]

#
# Reduzindo a complexidade de cada arvore (nodesize = 50)
#
newModel <- randomForest(myFormula, data=train, do.trace=100, importance = TRUE, nodesize = 50)
confusionMatrix(table(predict(newModel, newdata=train), train$Y))$overall[1]
confusionMatrix(table(predict(newModel, newdata=test), test$Y))$overall[1]

