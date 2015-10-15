## DASI (Courseracourse, Duke University, Mine Citenkaya-Rundel)

## Autumn 2015

## Lab 3a

load(url("http://www.openintro.org/stat/data/ames.RData"))

area <- ames$Gr.Liv.Area
price <- ames$SalePrice

summary(area)
hist(area)

samp0 <- sample(area, 50)
samp1 <- sample(area, 50)

mean(samp1)

sample_means50 <- rep(NA, 5000)

for(i in 1:5000){
        samp <- sample(area, 50)
        sample_means50[i] <- mean(samp)
}

hist(sample_means50)
hist(sample_means50, breaks = 25)

sample_means50 <- rep(NA, 5000)

for(i in 1:5000){
        samp <- sample(area, 50)
        sample_means50[i] <- mean(samp)
        print(i)
}

sample_means_small <- rep(NA, 100)

for(i in 1:100){
        samp <- sample(area, 50)
        sample_means_small[i] <- mean(samp)
        print(i)
}

hist(sample_means50)

sample_means10 <- rep(NA, 5000)
sample_means100 <- rep(NA, 5000)

for(i in 1:5000){
        samp <- sample(area, 10)
        sample_means10[i] <- mean(samp)
        samp <- sample(area, 100)
        sample_means100[i] <- mean(samp)
}

par(mfrow = c(3, 1))

xlimits = range(sample_means10)

hist(sample_means10, breaks = 20, xlim = xlimits)
hist(sample_means50, breaks = 20, xlim = xlimits)
hist(sample_means100, breaks = 20, xlim = xlimits)

par(mfrow = c(1, 1))


## Lab 3b
load(url("http://www.openintro.org/stat/data/ames.RData"))
population <- ames$Gr.Liv.Area
samp <- sample(population, 60)
summary(samp)
boxplot(samp)
hist(samp)

sample_mean <- mean(samp)

se <- sd(samp)/sqrt(60)
lower <- sample_mean - 1.96 * se
upper <- sample_mean + 1.96 * se
c(lower, upper)

mean(population)

samp_mean <- rep(NA, 50)
samp_sd <- rep(NA, 50)
n <- 60

for(i in 1:50){
        samp <- sample(population, n) # obtain a sample of size n = 60 from the population
        samp_mean[i] <- mean(samp)    # save sample mean in ith element of samp_mean
        samp_sd[i] <- sd(samp)        # save sample sd in ith element of samp_sd
}

lower <- samp_mean - 1.96 * samp_sd / sqrt(n) 
upper <- samp_mean + 1.96 * samp_sd / sqrt(n)

c(lower[1],upper[1])

plot_ci(lower, upper, mean(population))

lower99 <- samp_mean - 2.58 * samp_sd / sqrt(n) 
upper99 <- samp_mean + 2.58 * samp_sd / sqrt(n)

plot_ci(lower99, upper99, mean(population))

