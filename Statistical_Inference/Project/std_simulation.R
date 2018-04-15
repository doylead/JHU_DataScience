### Andrew Doyle
### Statistical Inferene on Coursera

# Setting the stage
rm(list=ls())
library(ggplot2)
library(scales)
setwd('~/Dropbox/Coursera/JHU_DataScience/Statistical_Inference/Project')

# To pull n data from an exponential distribution, lambda*exp(-lambda*x) for x>0
# p <- rexp(n,lambda)
# The distribution mean is 1/lambda
# The distribution standard deviation is 1/lambda

# The  tuning parameter for the exponential distribution
lambda <- 0.2
ilambda <- 1/lambda
# The number of points we'll pull from a distribution for each average
n <- 40
# The number of times we're running the simulation
m <- 1000

# Run the simulations
p <- rexp(m*n,lambda)
# Organize the values for easy access
q <- matrix(p,nrow=m,ncol=n)

# Calculate the means and standard deviations
q_means <- apply(q,1,mean)
q_var <- apply(q,1,var)

# Save our results to a data frame
df <- data.frame(q_means,q_var)
colnames(df) <- c('mean','var')

# Save output to a file
png("sample_var_distribution.png", width=480, height=480)

# Create an output histogram for the distribution of the means
bw <- 2
ddf <- n-1
g <- ggplot(df, aes(x=var)) +
  geom_histogram(color="darkblue", fill="lightblue", binwidth=bw) +
  geom_vline(aes(xintercept=ilambda^2),color="darkgreen", linetype="dashed", size=2) +
  labs(x="Sample Variance", y="Frequency") +
  theme(axis.text=element_text(size=16), axis.title=element_text(size=20))

print(g)
dev.off()