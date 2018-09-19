#
# Script para analise de overfitting e underfitting
#

# Function that returns Root Mean Squared Error
rmse <- function(error)
{
  sqrt(mean(error^2))
}

# Function that returns Mean Absolute Error
mae <- function(error)
{
  mean(abs(error))
}

load("data/20140917_imoveis_completo_tratado.rda")
set.seed(1234)
ind <- sample(2, nrow(imoveis), replace = TRUE, prob = c(0.8, 0.2))
train <- imoveis[ind == 1, ]
test <- imoveis[ind == 2,]

train <- train[sample(nrow(train)),]
test <- test[sample(nrow(test)),]

#
# variando o numero de exemplos no conjunto de treinamento
# 
myFormula <- preco ~ area + suites + dormitorios + banheiros + vagas
result <- data.frame(i=integer(), trainRmse=integer(), testRmse=integer(), trainMae=integer(), testMae=integer())
for (i in 2:nrow(train)){
  if(!i %% 100){
    train_temp <- train[1:i,]
    model <- lm(myFormula, data=train_temp)
    trainPred <- predict(model, newdata = train_temp)
    t <- rmse(trainPred - train_temp$preco)
    tM <- mae(trainPred - train_temp$preco)
    
    testPred <- predict(model, newdata = test)
    t2 <- rmse(testPred - test$preco)
    t2M <- mae(testPred - test$preco)
    
    print(paste(i,"  ",t,"  ",t2," ",tM," ",t2M))
    result <- rbind(result, c(i,t, t2,tM,t2M))  
  }
}

myFormula <- preco ~ area + suites + dormitorios + banheiros + vagas + bairro
model2 <- lm(myFormula, data=train)
trainPred <- predict(model2, newdata = test)
errorModel2 <- rmse(trainPred - test$preco)
maeModel2 <- mae(trainPred - test$preco)

names(result) <- c('i','trainRMSE','testRMSE','trainMAE','testMAE')
plot(result$testRMSE ~ result$i, type="l", col="red", main = "RMSE para o problema do preço de imóveis")

plot(result$trainMAE ~ result$i, type='l', col='red', 
     main="MAE para o problema do preço de imóveis",
     ylim=c(200000,300000))
lines(result$testMAE ~ result$i, type='l', col='blue')
abline(h=maeModel2, col="green")

legend("bottomright", inset = 0.15, title="Dataset",
       c("Train","Test","MAE com Bairro"), fill=c("red","blue","green"), horiz=FALSE)

#
# Melhorando o modelo sem bairro + Random Forest
#

library(randomForest)
myFormula <- preco ~ area + suites + dormitorios + banheiros + vagas
modelRF <- randomForest(myFormula, data=train, do.trace=100, importance = TRUE)
predRF <- predict(modelRF, newdata = test)
errorModelRF <- rmse(predRF - test$preco)
maeModelRF <- mae(predRF - test$preco)


