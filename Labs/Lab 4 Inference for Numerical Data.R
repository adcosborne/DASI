## DASI (Courseracourse, Duke University, Mine Citenkaya-Rundel)

## Autumn 2015

## Lab 4

# load the NC data

library(openintro)

data("ncbirths")
nc<-ncbirths

str(nc)

summary(nc)
#Weight gained by mothers during pregnancy

summary(nc$gained)
boxplot(nc$gained)
hist(nc$gained)

gained_clean = na.omit(nc$gained)
n = length(gained_clean)


boot_means = rep(NA, 100)

for(i in 1:100){
    boot_sample = sample(gained_clean, n, replace = TRUE)
    boot_means[i] = mean(boot_sample)                       
}

hist(boot_means)

source("http://bit.ly/dasi_inference")
inference(nc$gained, type = "ci", method = "simulation", conflevel = 0.90, est = "mean", boot_method = "perc")

# percentile method
inference(nc$gained, type = "ci", method = "simulation", conflevel = 0.95, est = "mean", boot_method = "perc")
# standard error method
inference(nc$gained, type = "ci", method = "simulation", conflevel = 0.95, est = "mean", boot_method = "se")
# create interval for median instead of mean
inference(nc$gained, type = "ci", method = "simulation", conflevel = 0.95, est = "median", boot_method = "se")

#habit and weight - compare medians
boxplot(nc$weight~nc$habit)

# compare means
by(nc$weight, nc$habit, mean)

by(nc$weight, nc$habit, length)

inference(y = nc$weight, x = nc$habit, est = "mean", type = "ht", null = 0, alternative = "twosided", method = "theoretical")
inference(y = nc$weight, x = nc$habit, est = "mean", type = "ht", null = 0, alternative = "twosided", method = "theoretical", order = c("smoker","nonsmoker"))
inference(y = nc$weight, x = nc$habit, est = "mean", type = "ci", null = 0, alternative = "twosided", method = "theoretical", order = c("smoker","nonsmoker"))

by(nc$mage, nc$mature, min)
by(nc$mage, nc$mature, max)

inference(y = nc$weight, x = nc$mature, est = "mean", type = "ci", null = 0, alternative = "twosided", method = "theoretical", order = c("mature mom","younger mom"))


## General Social Survey

load(url("http://bit.ly/dasi_gss_ws_cl"))
str(gss)
summary(gss)
table(gss)
boxplot(gss$wordsum~gss$class)

inference(y = gss$wordsum, x = gss$class, est = "mean", type = "ht", alternative = "greater", method = "theoretical")
