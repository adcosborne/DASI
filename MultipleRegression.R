## Multiple Regression

library(openintro)
data(COL)

# load data
states=read.csv("http://d396qusza40orc.cloudfront.net/statistics/lec_resources/states.csv")
str(states)

# fit model
pov_slr<-lm(poverty~female_house,data=states)
summary(pov_slr)
pov_anova_slr<-anova(pov_slr)
pov_anova_slr
sum(pov_anova_slr$`Sum Sq`)

plot(states$female_house,states$poverty,
     pch=19,
     col = "#569BBD",
     xlab=("% female householder"),
     ylab=("% poverty"))

text(15, 10, paste0('R2 = ', pov_slr$r.squared), pos = 3)
intercept=pov_slr$coefficients[1]
slope=pov_slr$coefficients[2]

abline(intercept,slope,col="red",lwd=2)

# R2 for this model with one variable
# manually...
r2_slr<-1-pov_anova_slr$`Sum Sq`[1]/sum(pov_anova_slr$`Sum Sq`)
r2_slr

# ANOVA allows you to partition the variability in the response variable

# add a variable
pov_mlr<-lm(poverty~female_house+white,data=states)
summary(pov_mlr)
pov_anova_mlr<-anova(pov_mlr)
pov_anova_mlr
sum(pov_anova_mlr$`Sum Sq`)
# note that total variability does not change - this value is inherent in the data
# whate does change, as vaibles are added to the model, is how it is partitioned
# among the variables.