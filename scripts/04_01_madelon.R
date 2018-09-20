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
# Crie modelos para este problema usando o que você já viu até
# agora nesta disciplina
#

