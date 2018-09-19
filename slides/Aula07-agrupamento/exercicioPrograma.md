Exercício Programa 3
========================================================

Considerando o dataset apresentado em (http://archive.ics.uci.edu/ml/datasets/Adult)[http://archive.ics.uci.edu/ml/datasets/Adult], faça uma análise dos possíveis agrupamentos encontrados levando em consideração os atributos _age_, _education-num_, _capital-gain_, _capital-loss_ e _hours-per-week_.

Para ter disponível o dataset, basta executar os comandos abaixo:


```r
# fileUrl <-
# 'http://archive.ics.uci.edu/ml/machine-learning-databases/adult/adult.data'
# download.file(fileUrl,destfile='adult.csv', method='curl')
dataset <- read.csv("adult.csv", sep = ",", header = FALSE)
head(dataset)
```

```
##   V1                V2     V3         V4 V5                  V6
## 1 39         State-gov  77516  Bachelors 13       Never-married
## 2 50  Self-emp-not-inc  83311  Bachelors 13  Married-civ-spouse
## 3 38           Private 215646    HS-grad  9            Divorced
## 4 53           Private 234721       11th  7  Married-civ-spouse
## 5 28           Private 338409  Bachelors 13  Married-civ-spouse
## 6 37           Private 284582    Masters 14  Married-civ-spouse
##                   V7             V8     V9     V10  V11 V12 V13
## 1       Adm-clerical  Not-in-family  White    Male 2174   0  40
## 2    Exec-managerial        Husband  White    Male    0   0  13
## 3  Handlers-cleaners  Not-in-family  White    Male    0   0  40
## 4  Handlers-cleaners        Husband  Black    Male    0   0  40
## 5     Prof-specialty           Wife  Black  Female    0   0  40
## 6    Exec-managerial           Wife  White  Female    0   0  40
##              V14    V15
## 1  United-States  <=50K
## 2  United-States  <=50K
## 3  United-States  <=50K
## 4  United-States  <=50K
## 5           Cuba  <=50K
## 6  United-States  <=50K
```

```r
names(dataset) <- c("age", "workclass", "fnlwgt", "education", "education_num", 
    "marital_status", "occupation", "relationship", "race", "sex", "capital_gain", 
    "capital_loss", "hours_per_week", "native_country", "class")
sapply(dataset, class)
```

```
##            age      workclass         fnlwgt      education  education_num 
##      "integer"       "factor"      "integer"       "factor"      "integer" 
## marital_status     occupation   relationship           race            sex 
##       "factor"       "factor"       "factor"       "factor"       "factor" 
##   capital_gain   capital_loss hours_per_week native_country          class 
##      "integer"      "integer"      "integer"       "factor"       "factor"
```


Faça a sua análise. A partir da análise, crie um relatório contendo os seguintes itens: 

* Título: o seu relatório precisa ter um título que sumariza bem o seu relatório;
* Introdução: descreva o dataset que você irá trabalhar e os objetivos da sua análise;
* Método: descreva as etapas que você executou para realizar a sua análise, por exemplo: (i) aquisição dos dados; (ii) análise dos dados; (iii) identificação de _missing_ e de _outliers_, e; (iv) identificação e análise dos agrupamentos.
* Resultados: descreve os resultados encontrados.
* Considerações finais: considerações breves sobre os resultados encontrados.

Não esquece de apresentar figuras que representam bem os resultados das análises. Cada figura deve possuir um título que descreve bem o objetivo daquela figura.
