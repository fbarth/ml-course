#
# Script para criacao do modelo e avaliacao
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
sort(table(imoveis$bairro), decreasing = TRUE)
length(table(imoveis$bairro))

set.seed(1234)
ind <- sample(2, nrow(imoveis), replace = TRUE, prob = c(0.8, 0.2))
train <- imoveis[ind == 1, ]
test <- imoveis[ind == 2,]

model <- lm(preco ~ ., data=train)
summary(model)
plot(model)

test$pred <- predict(model, test)
rmse(test$preco - pred)
mae(test$preco - pred)

test$error <- abs(test$preco - test$pred)
View(test)

predTrain <- predict(model, train)
rmse(train$preco - predTrain)
mae(train$preco - predTrain)
