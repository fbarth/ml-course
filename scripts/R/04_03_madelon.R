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

library(caret)
set.seed(1234)
trainIndex <- createDataPartition(dataset$Y, p = .8,
                                  list = FALSE,
                                  times = 1)
train <- dataset[trainIndex,]
test <- dataset[-trainIndex,]
train <- train[sample(nrow(train)),]
test <- test[sample(nrow(test)),]

#
# A acurácia do modelo desenvolvido usando ctree eh 0.73
# A acurácia do modelo usando randomForest eh 0.72
#
# Serah que nao eh possivel otimizar o modelo randomForest 
# ajustando os parametros do mesmo?
#

# https://en.wikipedia.org/wiki/Hyperparameter_optimization
# focar em GridSearch

library(randomForest)
# Number of variable is randomly collected to be sampled at each split time.
mtry <- c(10,50,100,150,200,250,300,350,400,450,500)
# Number of branches will grow after each time split.
# ntree <- c()

myFormula <- Y ~ .
for(i in mtry){
  print(i)
  model <- randomForest(myFormula, data=train, do.trace=100, mtry = i)
  plot(model, main = paste(i))
}

model <- randomForest(myFormula, data=train, do.trace=100, mtry = 250)
model

pred <- predict(model, newdata = test)
confusionMatrix(table(pred,test$Y))

#
# legal! aumento significado para 0,83 ajustando os hiperparâmetros com GridSearch
#

#
# vamos tentar outros hiperparâmetros!
#

ntree <- c(500,700,1000)
mtry <- c(10,50,100,150,200,250,300,350,400,450,500)
nodesize <- c(1,3,5,10,15,20)
#maxnodes <- c(10,100,NA)

myFormula <- Y ~ .
result <- data.frame(mtry=integer(), ntree=integer(), nodesize=integer(),  oob=integer())
for(i in mtry){
  for(j in ntree){
    for(k in nodesize){
        print(paste(i,'  ',j,'  ',k))
        model <- randomForest(myFormula, data=train, mtry = i, ntree = j, nodesize = k)  
        result <- rbind(result, c(i,j,k,model$err.rate[nrow(model$err.rate),1]))
    }
  }
}
names(result) <- c('mtry','ntree','nodesize','oob')
save(result, file = "data/04_03_madelon_result_gridsearch.Rda")

#
# A configuracao com o menor OOB foi mtry = 250, ntree = 1000, nodesize = 15
# criando modelo com esta configuração:

model <- randomForest(myFormula, data=train, do.trace=100, mtry = 250, ntree=1000, nodesize=15)
plot(model)
pred <- predict(model, newdata = test)
confusionMatrix(table(pred,test$Y))
