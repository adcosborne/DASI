## Date Analysis and Statistical Inference
## Duke University / Coursera

## Michael Hunt
## September 2015

## Lab 1:  Introduction to data

source("http://www.openintro.org/stat/data/cdc.R")
names(cdc)
str(cdc)
summary(cdc)
table(cdc$smoke100)/20000
barplot(table(cdc$smoke100))

table(cdc$genhlth)/20000

gender_smokers = table(cdc$gender,cdc$smoke100)
gender_smokers
mosaicplot(gender_smokers)

mdata = subset(cdc, cdc$gender == "m")

under23_and_smoke = subset(cdc, cdc$age <23 & cdc$smoke100 == 1)

summary(under23_and_smoke)
str(under23_and_smoke)

boxplot(cdc$height ~ cdc$gender)

bmi = (cdc$weight / cdc$height^2) * 703
boxplot(bmi ~ cdc$genhlth)
boxplot(bmi ~ cdc$age)

hist(bmi)
hist(bmi, breaks = 50)

plot(cdc$weight,cdc$wtdesire)
