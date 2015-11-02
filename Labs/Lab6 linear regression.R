## DASI Autumn 2015

## Michael Hunt

## 01-11-2015

## Lab 6

# load the data
load(url("http://www.openintro.org/stat/data/mlb11.RData"))
str(mlb11)

# Plot the relationship between runs andat bats, using at bats as the explanatory 
# variable. 
# The relationship appears to be...

plot(mlb11$runs~mlb11$at_bats)

cor(mlb11$runs, mlb11$at_bats)

plot_ss(x = mlb11$at_bats, y = mlb11$runs)

m1 <- lm(runs ~ at_bats, data = mlb11)

summary(m1)

m2 <- lm(runs ~ homeruns, data = mlb11)

summary(m2)

plot(mlb11$runs ~ mlb11$at_bats)
abline(m1)

observed5579<-mlb11$runs[mlb11$at_bats == 5579]
prediction5579<-m1$coefficients[1]+m1$coefficients[2]*5579
residual5579<-observed5579-prediction5579

mlb11$residuals<-m1$residuals

mlb11[mlb11$at_bats==5579,]

## Model Diagnostics

# (1) Linearity
plot(m1$residuals ~ mlb11$at_bats)
abline(h = 0, lty = 3)  # adds a horizontal dashed line at y = 0

# (2) Nearly normal residuals:
hist(m1$residuals)

qqnorm(m1$residuals)
qqline(m1$residuals)  # adds diagonal line to the normal prob plot

# (3) Constant variability:


# Quality of fit

summary(m1)
m1

# other predictors

m1 <- lm(runs ~ at_bats, data = mlb11)
summary(m1)$r.squared

m2 <- lm(runs ~ homeruns, data = mlb11)
summary(m2)$r.squared

m3 <- lm(runs ~ hits, data = mlb11)
summary(m3)$r.squared

m4 <- lm(runs ~ wins, data = mlb11)
summary(m4)$r.squared

m5 <- lm(runs ~ bat_avg, data = mlb11)
summary(m5)$r.squared

m6 <- lm(runs ~ new_onbase, data = mlb11)
summary(m6)$r.squared

m7 <- lm(runs ~ new_slug, data = mlb11)
summary(m7)$r.squared

m8 <- lm(runs ~ new_obs, data = mlb11)
summary(m8)$r.squared
