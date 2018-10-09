##Install Package lme4 
library(lme4)


##Data
good < − read.csv( file.choose() ) 
#choose student level data


##Restructuring Data
better < − subset( good, school = 0 )
better$y < − ifelse(better$performance == ”pass”, 0, 1 ) head(better)


##Mixed Effect Logistic Model
fit3 < − glmer( y ∼ econ + grade + (1| school), family=”binomial”, data=better) summary(fit3)
random.effects(fit3)


##Results 
beta0 < − 1.7418 
beta1 < − (-0.9884) 
beta2 < − 0.5539 
beta3 < − 0.8716

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
