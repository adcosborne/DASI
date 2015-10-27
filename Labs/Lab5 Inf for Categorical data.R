## Coursera DASI (Data Analysis and Statistical Inference)
## Lab 5
## Michael Hunt
## October 2015


source("http://bit.ly/dasi_inference")
load(url("http://www.openintro.org/stat/data/atheism.RData"))


#pick respondents from US
us12 = subset(atheism, atheism$nationality == "United States" & atheism$year == "2012")
str(us12)
table(us12$response)


inference(us12$response, est = "proportion", type = "ci", method = "theoretical", success = "atheist")

## Effect of proportion size on margin of error

n <- 1000
p <- seq(0, 1, 0.01)
me <- 2*sqrt(p*(1 - p)/n)
plot(me ~ p)

## True / False: There is convincing evidence that Spain has seen a change in its atheism index between 2005 and 2012.

spain<-subset(atheism, atheism$nationality == "Spain")
spain$year<-as.factor(spain$year)
str(spain)
inference(spain$response,spain$year, est = "proportion", type = "ci", method = "theoretical", success = "atheist")


## True / False: There is convincing evidence that the United States has seen a change in its atheism index between 2005 and 2012. 

us<-subset(atheism, atheism$nationality == "United States")
us$year<-as.factor(us$year)
str(us)
inference(us$response,us$year, est = "proportion", type = "ci", method = "theoretical", success = "atheist")

# Suppose you're hired by the local government to estimate the proportion of residents that attend a religious service on a weekly basis.
# According to the guidelines, the estimate must have a margin of error no greater than 1% with 95% confidence.
# You have no idea what to expect for p. How many people would you have to sample to ensure that you are within the guidelines?

# Take p=0.5 for max SE.
me=0.01
conf=0.95
(qnorm((1-conf)/2,lower.tail=FALSE)/(2*me))^2
