trips = alpha + beta(income)

If income is continuos:
beta (in english) = no of trips "increased" per unit increase in income
If income is discrete:

one hot encoding: (intuition) semm!
b1 = b2 = b3 ---> combine them into one variable! and b4,b5

Logistic regression:

-- What are the assumption in Logistic Regression? - (refer downloaded research paper)




################################################################################

Let Pearson correlation = r
then, R-squared = r^2 (interpretation - how much chnge in y is explained by the change in x) ---> r=0 (no relationship b/w x and y) and r=1 (perfect relationship)

Proper definition for R-squared:
R-squared = SSR/SST (used to comment on the goodness of fit of the model)
          = 1 - SSE/SST (basically, 1 - SS our current model/ SS of mean model)

SSR = sum( (pred.y - mean.y) )
SST = sum( (actual.y - mean.y) ) = model where we always predict mean of Y as output irrespective of X's.

SSE = sum( (actual.y - pred.y) ) = current model


########################### Linear Regression: #################################

Note: "All the inferences are invalid if the model doesn't satisfy the basic assumptions of linear regression (check slides)". Also google - "What are the remedies incase the assumptions are not satisfied"

For a given variable x,

    Ho = E[coefficient of x] = 0    (means y is independent of x)
    H1 = E[coefficient of x] != 0   (means y is dependent of x)
    
Interpretation: 
      If y is independent of x (i.e. x doesnt have significant impact on y), then coeff x must be zero (which is basically the null hypothesis). Therefore, if we get p-value less than 0.05 we can reject null hypothesis and say y is dependent of x and include x in the final model, otherwise remove x from the model

---> t-value = Estimate / Std. Error 


Let, Multiple R-squared:  0.389: This means 38.9% of the variation in 'Y' is explained by all the independent variables (X's) combined. The best model would be when Multiple R-squared = 1, which means 100% of the data variation is captured/explained by X's.

Note: "For Multiple Regression models (more than 1 independent variable), use Adjusted R-squared instaed of Multiple R-squared"

F-statistic and p-value: (in the last line of summary of regression output)

    Ho: All coeffs of the model are equal to zero
    H1: All coeffs of the model are not equal to zero
    
p-value: < 0.05, then we can classify the model as good model by rejecting the Null hypothesis

## Examples for experimentation:

    - summary(lm(c(2,3,4,5) ~ c(1,2,3,4)))
    - summary(lm(c(2,3,4,5) ~ c(1,2,3,4) + c(-1,-2,-3,-4.01)))
    - summary(lm(c(2,3,4,5) ~ c(-1,-2,-3,-4.01) + c(1,2,3,4)))
    - summary(lm(c(2,3,4,5) ~ c(-1,-2,-3,-4.01) + c(1,2.01,3,4)))

