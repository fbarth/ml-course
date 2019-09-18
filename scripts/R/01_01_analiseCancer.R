#
# O objetivo deste script é mostrar todo o processo para
# criação de classificadores, incluindo a etapa de validação,
# através de um problema para identificação de cancer 
# benigno e maligno.
#

dataset <- read.csv("data/breast-cancer-wisconsin.csv")
names(dataset)
dataset$X <- NULL
summary(dataset$diagnosis)
class(dataset$diagnosis)
dataset$id <- NULL
sapply(dataset, class)
summary(dataset)

# no site do kaggle existe uma descrição de cada atributo. 
# (1) Por favor, gastar 15 minutos lendo a descrição e discutindo com os colegas.

# "diagnosis" The diagnosis of breast tissues (M = malignant, B = benign)              
# "radius_mean" mean of distances from center to points on the perimeter            
# "texture_mean" standard deviation of gray-scale values            
# "perimeter_mean" mean size of the core tumor          
# "area_mean"               
# "smoothness_mean" mean of local variation in radius lengths         
# "compactness_mean" mean of perimeter^2 / area - 1.0        
# "concavity_mean" mean of severity of concave portions of the contour          

# (2) existe algum registro com valores nulos? 
sum(is.na(dataset))

# (3) qual é o tamanho do dataset? 
nrow(dataset)

# repensar o objetivo do exercício.
# criar um modelo preditivo capaz de identificar cancer benigno e cancer maligno
# este modelo precisa ser genérico.
#
# Ler o texto "6 Your dev and test sets should come from the same distribution"
# do arquivo docs/references/Ng_MLY01.pdf

# (4) separar conjunto de treinamento e de teste usando a mesma distribuicao do 
# atributo diagnosis

library(caret)
set.seed(1234)
trainIndex <- createDataPartition(dataset$diagnosis, p = .8,
                                  list = FALSE,
                                  times = 1)
train <- dataset[trainIndex,]
test <- dataset[-trainIndex,]

# (5) criando o modelo com os atributos selecionados

library(randomForest)
model <- randomForest(diagnosis ~ ., data=train, importance=TRUE, do.trace=100)
model

# (6) validando o modelo completo no conjunto de teste

testPred <- predict(model, newdata = test)
t <- table(testPred, test$diagnosis)
confusionMatrix(t)

# discutir os conceitos de accuracy, confusion matrix, sensitivity and specificity
# usar este texto como referência: https://en.wikipedia.org/wiki/Sensitivity_and_specificity

