data(cars)

setwd("~/Documents/aulas/bandtec/disciplinas/sistemasInteligentes/Aula06-slidesAM/Aula05-regressao/scripts")

png(filename="../figuras/fig01.png", width=600, height=400)
plot(cars$dist ~ cars$speed, pch=19, lwd=2, xlab="Velocidade", ylab="Distância", 
     main="Relação entre velocidade e distância para parar um carro")
dev.off()

png(filename="../figuras/fig02.png", width=600, height=400)
model <- lm(dist ~ 1, data=cars)
plot(cars$dist ~ cars$speed, pch=19, lwd=2, xlab="Velocidade", ylab="Distância", 
     main="Relação entre velocidade e distância para parar um carro")
abline(model, col="blue", lwd=3)
dev.off()

png(filename="../figuras/fig03.png", width=600, height=400)
model2 <- lm(dist ~ speed, data=cars)
plot(cars$dist ~ cars$speed, pch=19, lwd=2, xlab="Velocidade", ylab="Distância", 
     main="Relação entre velocidade e distância para parar um carro")
abline(model2, col="red", lwd=3)
dev.off()

reg <- function(x,y){
  x <- as.matrix(x)
  x <- cbind(Intercept = 1, x)
  solve(t(x) %*% x) %*% t(x) %*% y
}

reg(y = cars$dist, x = cars$speed)

data(airquality)
help(airquality)
head(airquality)

modelAirQuality <- lm(Ozone ~ Solar.R + Wind + Temp, data=airquality)

png(filename="../figuras/pairsNY.png", width=600, height=400)
pairs(airquality[1:4])
dev.off()
library(psych)
png(filename="../figuras/pairsPanelNY.png", width=600, height=400)
pairs.panels(airquality[1:4])
dev.off()

summary(modelAirQuality)

modelAirQuality2 <- lm(Ozone ~ Wind + Temp, data=airquality)

modelAirQuality3 <- lm(log(Ozone) ~ Solar.R + Wind + Temp, data=airquality)

modelAirQuality4 <- lm(log(Ozone) ~ Solar.R + Wind*Temp, data=airquality)

airquality$Solar2 <- airquality$Solar.R^2
airquality$Wind2 <- airquality$Wind^2
airquality$Temp2 <- airquality$Temp^2
modelAirQuality5 <- lm(log(Ozone) ~ Solar.R + Wind + Temp + Solar2 + Wind2 + Temp2, data=airquality)
