setwd('~/Dropbox/Coursera/JHU_DataScience/Statistical_Inference/Week 4')
rm(list=ls())

### Question 1

baseline <- c(140,138,150,148,135)
week2 <- c(132,135,151,146,130)

val <- t.test(baseline,week2, alternative="two.sided", 
              var.equal=FALSE, paired=TRUE)
#print(val)
# P-value is 0.08652

### Question 2

mu <- 1100
sd <- 30
n <- 9
conf <- mu + c(-1,1)*qt(0.975,n-1)*sd/sqrt(n)
#print(conf)
# [1] 1076.94 1123.06

### Question 3

val <- binom.test(c(3,1),alternative='g')
#print(val)
# P-value is 0.3125

### Question 4
obs_days <- 1787
obs_inf <- 10
bench_lam <- 0.01

val <- poisson.test(obs_inf, obs_days, bench_lam, alternative='less')
#print(val)
# P-Value is 0.03237

### Question 5
treat_mean <- -3
treat_std <- 1.5
treat_n <- 9
plac_mean <- 1
plac_std <- 1.8
plac_n <- 9

df <- treat_n + plac_n - 2
s_pool_2 <- ((treat_n-1)*treat_std^2 + (plac_n-1)*plac_std^2)/df

diff_mean <- treat_mean - plac_mean
t <- diff_mean / sqrt(s_pool_2/plac_n + s_pool_2/treat_n)

#print(t)
# Not entirely sure, but t=-5.12 seems really, really strong

### Question 6
# No R code required
# Selected would not reject

### Question 7
m <- 0.01
sd <- 0.04
n <- 100
alpha <- 0.05

val <- power.t.test(n=n,
                    delta=0.01,
                    sd=0.04,
                    sig.level=0.05,
                    type="one.sample",
                    alternative = 'one')
print(val$power)
# Answer is approximately 80%

### Question 8
val <- power.t.test(n=NULL,
                    delta=0.01,
                    sd=0.04,
                    sig.level=0.05,
                    power=0.90,
                    type="one.sample",
                    alternative = 'one')
#print(val$n)
# Answer is approximately 140