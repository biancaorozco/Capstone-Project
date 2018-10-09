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
