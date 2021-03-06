x <- rnorm(1000,10,5)
y <- sapply(x, function(x) rnorm(1,2*x+6,10))
dat_set <- data.frame(x,y)
ggplot()+
geom_point(data=dat_set, aes(x=x, y=y),size=1, color='brown')

indices <- sample(1000,400)
train <- dat_set[indices, ]
test <-dat_set[-indices, ]
ggplot()+geom_point(data=train, aes(x=x, y=y))+ggtitle("TRAINING SET")
ggplot()+geom_point(data=test, aes(x=x, y=y))+ggtitle("TEST SET")
model <- lm(y~x,  data=train)
model
x=5
predict(model, data.frame(x))
x <-  c(-5,30)
x_predict <- predict(model, data.frame(x))
endpoints <- data.frame(x, x_predict)
ggplot()+
  geom_point(data=train, aes(x=x, y=y))+
  geom_line(data=endpoints, aes(x=x,y=x_predict), color='brown', 
            size=1)+
  ggtitle("TRAINING SET")
x <- test$x
p <- predict(model, data.frame(x)) # or: predict(model, test)
#MSE
sum((test$y - predict(model,data.frame(x)))^2)
#AVG - test mean square error
mse_test_value <- mean((test$y - predict(model,data.frame(x)))^2)

# Quadratic
model_Q <- lm(y~x+I(x^2), data=train)
model_Q
#function for quadratic
f_Q <- function(x) {
  return(predict(model_Q,data.frame(x)))
}
#plotting training set with quadratic model for quadratic function
ggplot()+
  geom_point(data=train, aes(x=x, y=y))+
  geom_line(data=endpoints, aes(x=x,y=x_predict), color='brown', 
            size=1)+
  stat_function(data=data.frame(x=c(-5,30)), aes(x=x), fun=f_Q,
                color='blue', size=1)+
  ggtitle("TRAINING SET")

#calculate test MSE for quadratic
mean((test$y-predict(model_Q, test))^2)
mse_test <- mean((test$y - predict(model,data.frame(x)))^2)

model_3 <- lm(formula=y~poly(x,3, raw=T), data=train)
mse_3 <- mean((test$y-predict(model_3,test))^2)
mse_v<-numeric()
for(i in 1:10) {
  model <- lm(formula=y~poly(x,i, raw=T), data=train)
  mse_v[i] <- mean((test$y-predict(model,test))^2)
}
mse_v


#visualize MSE
y_m <- mse_v
x_m <- 1:10
mse_p <- data.frame(x_m, y_m)

ggplot()+
  geom_point(data=mse_p, aes(x=x_m, y=y_m), size=2)+
  geom_line(data=mse_p, aes(x=x_m, y=y_m), size=1)
mse_calc <- function(train,test){
  for(i in 1:10) {
    model <- lm(formula=y~poly(x,i, raw=T), data=train)
    mse[i] <- mean((test$y-predict(model,test))^2)
    
  }
  return(mse)
}
x<- 1:10
plot<-ggplot()
for(i in 1:10){
  ind <- sample(1000,500)
  train <- dat_set[ind,]
  test <- dat_set[-ind,]
  y<-mse_calc(train,test)
  mse_poly <- data.frame(x,y)
  plot<-plot+geom_point(data=mse_poly, aes(x,y), size=3)
  plot<-plot+geom_line(data=mse_poly, aes(x,y))
}
plot