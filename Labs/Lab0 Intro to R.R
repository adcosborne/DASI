## Date Analysis and Statistical Inference
## Duke University / Coursera

## Michael Hunt
## September 2015

## Lab 0: Introduction to R and RStudio

source("http://www.openintro.org/stat/data/present.R")

present
dim(present)
names(present)

plot(x = present$year, y = present$girls)
plot(x = present$year, y = present$girls, type = "l")
plot(x = present$year, y = present$boys, type = "l")

present$boys + present$girls
plot(present$year, present$boys + present$girls, type = "l")

present[which.max(present$boys + present$girls),]

present$propBoys<-present$boys / (present$boys + present$girls)
present$propGirls<-present$girls / (present$boys + present$girls)
present$BgRatio<-present$boys/present$girls
plot(present$year, present$propBoys, type = "l")
plot(present$year, present$propGirls, type = "l")
plot(present$year, present$BgRatio, type = "l")

present$boys > present$girls

present[which.max(present$boys - present$girls),]
