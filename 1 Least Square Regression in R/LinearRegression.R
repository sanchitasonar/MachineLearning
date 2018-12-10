height <- c(160 ,   165  ,  175  ,  170 ,   155)
weight <- c(52 ,   59  ,  73  ,  66  ,  45)



plot(height,weight,
       main="Body Mass Index",
       sub="/home/ssl-18/Desktop/obese.csv")
cor(height,weight)
fit <- lm(height~weight)
fit
attributes(fit)
abline(fit) 