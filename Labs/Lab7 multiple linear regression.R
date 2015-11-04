## DASI LAb 7

## Michael Hunt

## November 2015

## Multiple linear regression: Rating the Professor

# load the data
load(url("http://www.openintro.org/stat/data/evals.RData"))

#
hist(evals$score)
plot(jitter(evals$score) ~ jitter(evals$bty_avg))

m_bty<-lm(evals$score~evals$bty_avg)
summary(m_bty)

abline(m_bty)

plot(evals$bty_avg ~ evals$bty_f1lower)
cor(evals$bty_avg, evals$bty_f1lower)

plot(evals[,13:19])

m_bty_gen <- lm(score ~ bty_avg + gender, data = evals)
summary(m_bty_gen)

plot(m_bty$residuals)
hist(m_bty$residuals)
qqnorm(m_bty$residuals)
qqline(m_bty$residuals)

multiLines(m_bty_gen)


m_bty_rank<- lm(score ~ bty_avg + rank, data = evals)


m_full <- lm(score ~ rank + ethnicity + gender + language + age + cls_perc_eval 
             + cls_students + cls_level + cls_profs + cls_credits + bty_avg, data = evals)
summary(m_full)

m_NoProfsSingle <- lm(score ~ rank + ethnicity + gender + language + age + cls_perc_eval 
             + cls_students + cls_level  + cls_credits + bty_avg, data = evals)
summary(m_NoProfsSingle)$adj.r.squared

m1 <- lm(score ~ ethnicity + gender + language + age + cls_perc_eval 
         + cls_students + cls_level + cls_profs + cls_credits + bty_avg, data = evals)
summary(m1)$adj.r.squared

m2 = lm(score ~ rank + ethnicity+ gender + language + age + cls_perc_eval + 
            cls_students + cls_level + cls_profs + cls_credits + bty_avg, data = evals)
summary(m2)$adj.r.squared

m3 = lm(score ~ gender + language + age + cls_perc_eval + 
            cls_students + cls_level + cls_profs + cls_credits + bty_avg, data = evals)
summary(m3)$adj.r.squared

m4 = lm(score ~ gender + language + age + cls_perc_eval + 
            cls_students + cls_level + cls_credits + bty_avg, data = evals)
summary(m4)$adj.r.squared

m5 = lm(score ~ gender + language + age + cls_perc_eval + 
            cls_level + cls_credits + bty_avg, data = evals)
summary(m5)$adj.r.squared

m6 = lm(score ~ gender + language + age + cls_perc_eval + 
            cls_level + cls_credits, data = evals)
summary(m6)$adj.r.squared