elbow <- function(dataset) {
  wss <- numeric(15)
  for (i in 1:15) wss[i] <- sum(kmeans(dataset, centers = i, nstart = 100)$withinss)
  plot(1:15, wss, type = "b", main = "Elbow method", xlab = "Number of Clusters", 
       ylab = "Within groups sum of squares", pch = 8)
}

library(UsingR)
data(survey)


data <- survey[,2:3]
data <- data[complete.cases(data),]

elbow(data)

model <- kmeans(data, centers = 4, nstart = 100)
data$cluster <- model$cluster
plot(data$Wr.Hnd, data$NW.Hnd, pch=19, col=data$cluster)

model <- kmeans(data, centers = 6, nstart = 100)
data$cluster <- model$cluster
plot(data$Wr.Hnd, data$NW.Hnd, pch=19, col=data$cluster)

