weight<-c(46,57,68,75,80,77,69,80,55,63);
height<-c(140,150,162,172,180,176,167,180,150,165);
plot(height,weight,main="Academic Performance");
fit<- lm(weight~height);

w.mean<-mean(weight);
h.mean<-mean(height);
print(w.mean);

result.mul2=0;
result.mul1=0;

for (i in 1:length(weight)){
  result.mul=(weight[i]-w.mean)*(height[i]-h.mean);
  result.mul1=result.mul1+result.mul;
}

for (i in 1:length(weight)){
  result.mul=(weight[i]-w.mean)*(weight[i]-h.mean);
  result.mul2=result.mul2+result.mul;
}

result.b=result.mul1/result.mul2;
result.a=w.mean-result.b*h.mean;

print(paste0("The Value of intercept is: ", result.b));
print(paste0("The Value of Regression Coefficient is:", result.a));

#Optional Prediction using predict function
a<-data.frame(height=300);
result<-predict(fit,a);
print(paste0("The predicted weight for given height is: ",result));
#end of optional prediction.

abline(fit)
abline(a = NULL, b = NULL, h = w.mean, v = h.mean, reg = NULL,
       coef = NULL, untf = FALSE,col="RED")