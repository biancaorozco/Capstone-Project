##Install Package mosaic 
library(mosaic)


##Data
data < − read.csv( file.choose()) 
#choose school level data


##Restructuring data head(data,7)
data0 < − data[1:6,]


##Multiple Logistic Model
fit < − glm( prop.fail ∼ econ + grade, family=”binomial”, weights=total.tested, data=data0 )
summary(fit)


##Results 
beta0 < − 1.65 
beta1 < − (-1.24) 
beta2 < − 0.55 
beta3 < − 0.81

#When X=1, Z1=Z2=0
pi1 < − (exp(beta0+beta1))/(1+exp(beta0+beta1))

#When X=0, Z1=Z2=0
pi2 < − (exp(beta0))/(1+exp(beta0))

#comparing 3rd graders 
pi2/pi1

#When X=1, Z1=1, Z2=0
pi3 < − (exp(beta0+beta1+beta2))/(1+exp(beta0+beta1+beta2))

#When X=0, Z1=1, Z2=0
pi4 < − (exp(beta0+beta2))/(1+exp(beta0+beta2))

#comparing 4th graders 
pi4/pi3

#When X=1, Z1=0, Z2=1
pi5 < − (exp(beta0+beta1+beta3))/(1+exp(beta0+beta1+beta3))

#When X=0, Z1=0, Z2=1
pi6 < − (exp(beta0+beta3))/(1+exp(beta0+beta3))

#comparing 5th graders 
pi6/pi5
