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
# A acurácia do modelo desenvolvido usando ctree eh 0.73 no conjunto de teste
# A acurácia do modelo usando randomForest eh 0.72 no conjunto de teste
#
# Serah que nao eh possivel otimizar o modelo randomForest 
# ajustando os parametros do mesmo?
#

# Exercício 1:
# https://en.wikipedia.org/wiki/Hyperparameter_optimization
# focar em GridSearch. Primeiro usando os parametros mtry e ntree
# encontre o OOB com menor erro. Utilize este modelo para comparar com o conjunto de teste
# Você precisa encontrar um modelo que tenha no mínimo 0.80 de acurácia no conjunto de teste
# Você deve entregar uma explicação sobre o que é GridSearch e os valores dos parâmetros encontrados
# no caso do melhor modelo.


# Exercício 2: 
# E se além de ajustar os parâmetros de mtry e ntree. Ajustar também o nodesize e maxnodes? 
#
# No entanto, antes de ajustar, responda as seguintes perguntas: 
# 1) O que significa o parametro nodesize?
# 2) O valor default deste parâmetro é 1. Isto significa o que? 
# 3) Qual será a consequência esperada ao aumentar este número?
# 4) O que significa o parametro maxnodes?
# 5) Qual eh o range de valores que devemos configurar para o GridSearch? 
# 6) Encontrou um modelo ainda melhor? Quais são os valores dos parâmetros e qual a acurácia? 
# 7) Na sua opinião, qual é o principal problema do GridSearch? 


