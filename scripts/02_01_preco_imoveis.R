#
# Exercício: 
# 1. Fazer a carga do dataset data/20140917_imoveis_completo.rda
# 2. Entender o problema
# 3. Entender os dados
# 4. Preparar os dados
#
# os comandos deste arquivo são iguais aos comandos do scrip 02_01_preco_imoveis.Rmd

# carga dos dados
#
load(file = 'data/20140917_imoveis_completo.rda')
class(imoveis)
names(imoveis)
nrow(imoveis)
sapply(imoveis, class)

imoveis$descricao <- NULL

barplot(sort(table(imoveis$bairro), decreasing = TRUE), las=2, main="Bairros")
sort(table(imoveis$bairro), decreasing = TRUE)
length(table(imoveis$bairro))

summary(imoveis$preco)
nrow(imoveis[imoveis$preco == 0, ])
imoveis <- imoveis[imoveis$preco > 0, ]
boxplot(imoveis$preco, outline = FALSE, main="Boxplot preço")

nrow(imoveis[imoveis$preco > 5000000, ])
imoveis <- imoveis[imoveis$preco < 5000000, ]

summary(imoveis$area)
imoveis <- imoveis[complete.cases(imoveis$area), ]
boxplot(imoveis$area)
imoveis[imoveis$area < 10, c('area','preco','bairro')]
imoveis <- imoveis[imoveis$area > 10, ]
imoveis[imoveis$area < 20, c('area','preco','bairro','dormitorios')]
hist(imoveis$area, main="Área dos apartamentos")

summary(imoveis$dormitorios)
imoveis <- imoveis[complete.cases(imoveis$dormitorios),]
barplot(table(imoveis$dormitorios), main="Dormitórios")

summary(imoveis$banheiros)
imoveis <- imoveis[complete.cases(imoveis$banheiros), ]
table(imoveis$banheiros)
imoveis <- imoveis[imoveis$banheiros < 15, ]
barplot(table(imoveis$banheiros), main="Banheiros")

summary(imoveis$suites)
imoveis$suites <- ifelse(is.na(imoveis$suites), 0, imoveis$suites)
table(imoveis$suites)
barplot(table(imoveis$suites), main="Suites")

summary(imoveis$vagas)
imoveis$vagas <- ifelse(is.na(imoveis$vagas), 0, imoveis$vagas)
table(imoveis$vagas)
barplot(table(imoveis$vagas), main="Vagas")

nrow(imoveis)
sum(is.na(imoveis))

# vamos trabalhar apenas com apartamentos até 600m2

imoveis <- imoveis[imoveis$area <= 600, ]
hist(imoveis$area, main="Área dos apartamentos")

plot(imoveis$area ~ imoveis$dormitorios, pch=19, main="Relação área vs dormitórios")
imoveis <- imoveis[imoveis$dormitorios < 7, ]
plot(imoveis$area ~ imoveis$dormitorios, pch=19, main="Relação área vs dormitórios")
plot(imoveis$dormitorios ~ imoveis$suites, pch=19, main="Relação dormitórios vs suítes")

# nao podemos ter a quantidade de suites maior que a quantidade de dormitorios
sum(imoveis$suites <= imoveis$dormitorios)
imoveis <- imoveis[(imoveis$suites <= imoveis$dormitorios), ]
plot(imoveis$dormitorios ~ imoveis$suites, pch=19, main="Relação dormitórios vs suítes")

plot(imoveis$area ~ imoveis$banheiros, pch=19, main="Relação área vs banheiros")
plot(imoveis$suites ~ imoveis$banheiros, pch=19, main="Relação suites vs banheiros")
plot(imoveis$dormitorios ~ imoveis$banheiros, pch=19, main="Relação dormitórios vs banheiros")
imoveis <- imoveis[imoveis$banheiros < 10, ]

plot(imoveis$area ~ imoveis$vagas, pch=19, main="Relação área vs vagas")
imoveis <- imoveis[imoveis$vagas < 10, ]
plot(imoveis$area ~ imoveis$vagas, pch=19, main="Relação área vs vagas")

library(ggplot2)
temp <- imoveis[(imoveis$bairro == 'ipiranga' | imoveis$bairro == 'paraiso'), ]
qplot(temp$area, temp$preco, col=temp$bairro, size=temp$vagas, main = "Bairro vs preço")

cor(imoveis[, 2:7])

# Bairros pouco representativos serão excluídos. Todos os exemplos de bairros com menos de 10 
# apartamentos serão excluídos.

sort(table(imoveis$bairro), decreasing = TRUE)
imoveis <- imoveis[imoveis$bairro != 'city-butanta', ]
imoveis <- imoveis[imoveis$bairro != 'cantareira', ]
imoveis <- imoveis[imoveis$bairro != 'parelheiros', ]
imoveis <- imoveis[imoveis$bairro != 'parque-continental', ]
imoveis <- imoveis[imoveis$bairro != 'itaim-paulista', ]
imoveis <- imoveis[imoveis$bairro != 'bresser', ]
imoveis <- imoveis[imoveis$bairro != 'jardim-sao-bento', ]
imoveis <- imoveis[imoveis$bairro != 'parque-edu-chaves', ]
imoveis <- imoveis[imoveis$bairro != 'jardim-lusitania', ]
imoveis <- imoveis[imoveis$bairro != 'riviera-paulista', ]
imoveis <- imoveis[imoveis$bairro != 'city-butanta', ]

imoveis$bairro <- factor(imoveis$bairro)
sort(table(imoveis$bairro), decreasing = TRUE)


# salvando o dataset tratado
save(imoveis, file = "data/20140917_imoveis_completo_tratado.rda")

