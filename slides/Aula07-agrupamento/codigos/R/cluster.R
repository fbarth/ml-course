elbow <- function(dataset){
  wss <- numeric(15)
  for (i in 1:15) 
    wss[i] <- sum(kmeans(dataset,centers=i, nstart=100)$withinss)
  plot(1:15, wss, type="b", main="Elbow method", xlab="Number of Clusters",ylab="Within groups sum of squares", pch=24)
}

plotClusters <- function(dataset, centers){
  km <- kmeans(dataset,centers, nstart=100)
  plot(dataset, col = km$cluster)
  points(cluster$centers,km$cluster,pch=19,cex=3,lwd=3)
}

data <- read.csv("earthquakeData.csv")
head(data)
summary(data$Magnitude)
summary(data$Depth)

data$MagnitudeNorm <- data$Magnitude / max(data$Magnitude)
data$DepthNorm <- data$Depth / max(data$Depth)

summary(data$MagnitudeNorm)
summary(data$DepthNorm)

cluster <- kmeans(data[,11:12], centers=2)
cluster
plot(data$MagnitudeNorm, data$DepthNorm, pch=21, bg=c("red", "green")[cluster$cluster])
#plot(x,y,col=kmeansObj$cluster,pch=19,cex=2) 
points(cluster$centers,col=1:2,pch=3,cex=3,lwd=3)

elbow(data[,11:12])
cluster <- kmeans(data[,11:12], centers=4)
par(mfrow=c(1,2))
plot(data$MagnitudeNorm, data$DepthNorm, pch=21, bg=c("red", "green", "yellow", "cyan")[cluster$cluster])
plot(data$Magnitude, data$Depth, pch=21, bg=c("red", "green", "yellow", "cyan")[cluster$cluster])

par(mfrow=c(1,1))
plotClusters(data[,11:12], 4)
