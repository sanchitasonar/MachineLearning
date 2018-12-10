dim(iris)
names(iris)
str(iris)
attributes(iris)
iris[1:5,]
newiris <- iris
newiris$Species <- NULL
(kc <- kmeans(newiris, 3))
table(iris$Species, kc$cluster)
plot(newiris[c("Sepal.Length", "Sepal.Width")], col=kc$cluster)
points(kc$centers[,c("Sepal.Length", "Sepal.Width")], col=1:5, pch=8, cex=2)

idx <- sample(1:dim(iris)[1], 20)
irisSample <- iris[idx,]
irisSample$Species <- NULL
hc <- hclust(dist(irisSample), method="ave")
plot(hc, hang = -1, labels=iris$Species[idx])