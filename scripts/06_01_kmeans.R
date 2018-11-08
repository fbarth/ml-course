elbow <- function(dataset) {
  wss <- numeric(15)
  for (i in 1:15) wss[i] <- sum(kmeans(dataset, centers = i, nstart = 100)$withinss)
  plot(1:15, wss, type = "b", main = "Elbow method", xlab = "Number of Clusters", 
       ylab = "Within groups sum of squares", pch = 8)
}

library(UsingR)
data(survey)
