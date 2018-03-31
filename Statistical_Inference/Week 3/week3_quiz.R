# Set the working directory
setwd('~/Dropbox/Coursera/JHU_DataScience/Statistical_Inference/Week 3')
rm(list=ls())

### Question 1
# INCORRECT
n <- 9
u <- 1100
sd <- 30

CI <- u + qt(c(0.025,0.975),df=n-1)*sd/sqrt(n)
#print(CI)
# Output
# [1] 1076.94 1123.06

### Question 2
n <- 9
u <- -2

t <- qt(c(0.025,0.975), df=n-1)
# Using a two-tailed test for some reason

# CI = u +- t*sd/sqrt(n)
# CI reaches 0
# u = +- t*sd/sqrt(n)
# sd = u*sqrt(n)/t
sd <- u*sqrt(n)/t
#print(sd)
# Output
# [1]  2.601903 -2.601903

### Question 3
# Did not require R code
# Paired

### Question 4
new_mwt_mean <- 3
new_mwt_var <- 0.6
new_n <- 10
old_mwt_mean <- 5
old_mwt_var <- 0.68
old_n <- 10

diff_mean <- new_mwt_mean - old_mwt_mean
pool <- sqrt(new_mwt_var/new_n + old_mwt_var/old_n)
CI <- diff_mean + qt(c(0.025,0.975), df=new_n+old_n-2)*pool
#print(CI)
# Output
# [1] -2.751649 -1.248351

### Question 5
# Did not require R code
# Narrower

### Question 6
new_mwt_mean <- 4
new_mwt_std <- 0.5
new_mwt_var <- new_mwt_std^2
new_n <- 100
old_mwt_mean <- 6
old_mwt_std <- 2
old_mwt_var <- old_mwt_std^2
old_n <- 100

# Using normal quantiles as n is high
pool <- sqrt(new_mwt_var/new_n + old_mwt_var/old_n)
CI <- (old_mwt_mean-new_mwt_mean) + qnorm(c(0.025,0.975))*pool
print(CI)
# Output
# [1] 1.596 2.404

### Question 7
treatment_mean <- -3
treatment_std <- 1.5
treatment_var <- treatment_std^2
treatment_n <- 9
placebo_mean <- 1
placebo_std <- 1.8
placebo_var <- placebo_std^2
placebo_n <- 9

diff_mean <- treatment_mean - placebo_mean
s <- sqrt(((placebo_n-1)*placebo_var+(treatment_n-1)*treatment_var)/(placebo_n+treatment_n-2))
CI <- diff_mean + qt(c(0.05, 0.95),df=placebo_n+treatment_n-2)*s*sqrt(1/placebo_n+1/treatment_n)
#print(CI)
# Output
# [1] -5.363579 -2.636421
