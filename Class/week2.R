### Last class ####
# Non parametric data --> use Spearman correlation
# One-way and two ANOVA tests
# assumptions in ANOVA -->equal variance (can be checked using bartlett) and data is from normal distribution (can be checked using qqplot)

# Type 1,2,3,4 in ANOVA ??

seatbelts = data.frame(Seatbelts)
attach(seatbelts)

# qqplot ---> sorts two samples and pair those points and plot
qqplot(front, rnorm(length(front)))
qqline(front, rnorm(length(front)))
# at the tails there are some deviations

# Shapiro-Wilk test for normality
shapiro.test(front) # says front is normally distributed (Null hypothesis) --> p>0.05

# Kolmogorov-smirnov test --> check if both data belongs to same distribution (any)
# finds the maximum deviation between the 2 curves = D
ks.test(front, "pnorm", mean(front), sd(front)) # says front is normally distributed --> p>0.05

# Chi-squared test if distributions are equal

front.freq = table(cut(front, 8))
norm.freq = table(cut(rnorm(100), 8))
chisq.test(front.freq, norm.freq)

front.freq = table(cut(front, 8))
norm.freq = table(cut(rnorm(length(front)), 8))  # irrespective of length of rnorm, we get same p-value for both the cases ---> different?
chisq.test(front.freq, norm.freq)

# Conclusion: p-values for all three tests are different
# If the tests give contradicting results which one to use? --> Use Shapiro-Wilk test as it specializes on normality tests


### September 11th, Friday ###

# Linear Regression:

attd = attitude
pairs(attitude, main = "attitude data")
cor(attitude) # be careful ---> make sure there is no high correlation among X's

fm <- lm(rating ~ complaints, data = attitude)
summary(fm)
fm$residuals  # error terms
plot(attitude$complaints, fm$residuals)
plot(attitude$rating, fm$residuals)

# plot residuals v/s X and v/s Y

summary(fm2 <- lm(rating ~ learning + complaints, data = attitude))
summary(fm1 <- lm(rating ~ ., data = attitude))

# how to analyse linear regression output table ??
# Residual standard error --> sum((actual.y - pred.y))
# Multiple R-squared --> nothing but R-squared
# what is Adjusted R-squared etc...??






#.