##Install Package mosaic 
library(mosaic)


##Data
data < − read.csv(file.choose()) 
#choose student level data


##Restructuring data
data1 < − subset(data, school != 0)
data1$economic < − ifelse(data1$econ == ”disadv”, ”Disadvantaged”, ”Not Disadvantaged”)
str(data1)
schoolcode < − factor(data1$school)


##Tables
t1 < − table(data1$econ, data1$grade)
t2 < − table(data1$performance, data1$grade)
t3 < − table(data1$performance, data1$economic) 
t4 < − table(data1$performance, schoolcode)
t5 < − table(data1$econ, schoolcode)


##Barplots
barplot(t1, main = ”Salinas City Elementary School District Student Count by Economic Status and Grade”, xlab = ”Grade”, ylab = ”Frequency”, col = c(”purple”, ”orange”), legend = c(”Disadvantaged”, ”Not Disadvantaged”), beside= T, axes = T)
barplot(prop.table(t2, 2), main = ”Salinas City Elementary School District Stu- dents’ Performance by Grade Level”, xlab = ”Grade”, ylab = ”Proportion”, col = c(”yellow”, ”coral”), legend = c(”Fail”, ”Pass”), beside=T, axes = T)
barplot(prop.table(t3, 2), main = ”Salinas City Elementary School District Stu- dents’ Performance by Economic Status”, xlab = ”Economic Status”, ylab = ”Proportion”, col = c(”yellow”, ”coral”), legend = c(”Fail”, ”Pass”), beside=T, axes = T)
barplot(t4, main = ”Salinas City Elementary School District Students’ Perfor- mance by School Code”, ylab = ”Frequency”, col = c(”yellow”, ”coral”), legend = c(”Fail”, ”Pass”), beside=T, axes = T, las = 2)
barplot(t5, main = ”Salinas City Elementary School District Students’ Eco- nomic Status by School Code”, ylab = ”Frequency”, col = c(”purple”, ”or- ange”), legend = c(”Disadvantaged”, ”Not Disadvantaged”), beside=T, axes = T, las = 2)



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
