RawData <- read.table("/home/ssl-18/Desktop/diabetes.csv", sep = ",", header = F)
responseY <- as.matrix(RawData[,dim(RawData)[2]])
predictor <- as.matrix(RawData[,1:(dim(RawData)[2]-1)])
pca <- princomp(predictor,cor=T)
pc.comp <- pca$scores
pc.comp1 <--1*pc.comp[,1]
pc.comp2 <--1*pc.comp[,2]
library(class)
X.train <- cbind(pc.comp1,pc.comp2)
model.knn <- knn(train = X.train, test = X.train, cl = responseY, k = 19, prob = T)
plot(pc.comp1,pc.comp2,col=model.knn)
