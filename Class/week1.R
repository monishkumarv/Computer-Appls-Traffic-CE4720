############ Friday, 3th Sept ############ 

# Correlation plot
library(corrplot)

# Hypothesis testing
seatbelts = data.frame(Seatbelts)
attach(seatbelts)
summary(front)
var(front) ** 0.5

# Degree of freedom is high ---> so it (t-distribution) is nearly 
# equal to normal distribution value
t.test(front, alternative = "two.sided", mu=800)
t.test(front, alternative = "greater", mu=800)
t.test(front, alternative = "less", mu=800)    # Alternate hypothesis is true

# Paired test
# Null hypothesis => mu1-mu2 = 0
t.test(x = front[law == 0],y = front[law == 1], alternative = "greater", mu=0)

t.test(x = front[law == 0],y = NULL, alternative = "greater", mu=mean(front[law == 1]))
# Are both the above same ?------------------ Doubt ?????????????????

# Anyway you cant perform t-tests on Time Series data like above
# You can perform the test only on random variables (unpredictable) (time series data is not random as they are time dependent --> i.e., they are predictable given the past data)


temp = c(1,1,0,0,0,0,0,0,0,0,0,1)
seatbelts$winter = temp

detach(seatbelts)
attach(seatbelts)

# Variance test (F test) ---> for two samples
var.test(x = front[winter == 0], y = front[winter == 1], alternative = "two.sided")
pf(0.688,df1 = 143,df2 = 47,lower.tail = FALSE)

############ Friday, 4th Sept ############ 

# Bartlett test (variance test) ---> for more than two samples
bartlett.test(front ~ winter) 
# What is the difference between this and var.test? --> They use different distribution (f and chisq) for hypothesis testing --> but stil they both yeild close enough p-values
# Conclusion: var.test is used for 2 samples while bartlett test is used for 2 or more samples and they both yeild close enough results for 2 samples so you can use any one of them for 2 sample test
pchisq(2.6046,df = 1,lower.tail = FALSE)


temp = c(1,1,2,2,2,3,3,3,3,4,4,1) # 1=Winter, 2=Spring, 3=Summer, 4=Fall
seatbelts$seasons = temp

bartlett.test(front ~ seasons, data = seatbelts)

detach(seatbelts)
attach(seatbelts)

sd(front[seasons == 1])
sd(front[seasons == 2])
sd(front[seasons == 3])
sd(front[seasons == 4])

# Testing whether front is affected by seasons
# ANOVA
aov(front ~ seasons, data = seatbelts)

summary(aov(front ~ seasons, data = seatbelts))
summary(aov(front ~ law, data = seatbelts))

summary(aov(front ~ seasons + law, data = seatbelts))
summary(aov(front ~ seasons * law, data = seatbelts))

# Check ---> numbers aren't matching with others


# qqplot checks if both the input data come from the same distribution
# here we are checking whether front belongs to normal distribution
# better than using density plot(coz while using density plots it is difficult to say how accurate 
# and symmetric the bell-shape (for normal distribution) is. So it is better to use qqplot)
# Using qqplot we can check whether the variable belongs to any type of distribution. 
qqplot(front, rnorm(length(front)))
qqline(front, rnorm(length(front)))











#