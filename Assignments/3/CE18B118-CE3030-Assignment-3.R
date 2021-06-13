
######################## Question No. 1 #################################

attach(mtcars)

# Figure 1
plot(disp,mpg, pch='.', col = 'white', xlab = "DISP", ylab = "MPG")
text(disp, mpg, rep(LETTERS,length.out = 32), cex = 0.7)

# Figure 2
plot(disp,1/mpg, pch='.', col = 'white', xlab = "DISP", ylab = "GPM")
text(disp, 1/mpg, rep(LETTERS,length.out = 32), cex = 0.7)


# Figure 3
gpm = 1/mpg
hp_per_wt = hp/wt

model_1 = lm(gpm ~ wt)
model_2 = lm(hp_per_wt ~ wt)

plot(model_2$residuals, model_1$residuals, pch='.', col = 'white', xlab = " HP/WT . WT", ylab = " GPM . WT")
text(model_2$residuals, model_1$residuals, rep(LETTERS,length.out = 32), cex = 0.7)


# Figure 4 and Table 2
gpm = 100/mpg
hp_per_wt = hp/wt

gpm_model = lm(gpm ~ wt + hp_per_wt)
summary(gpm_model)
shapiro.test(gpm_model$residuals)

plot(sort(rnorm(length(gpm))),sort(gpm_model$residuals), pch='.', col = 'white', xlab = "RNORM", ylab = "RESIDUAL")
text(sort(rnorm(length(gpm))),sort(gpm_model$residuals), rep(LETTERS,length.out = 32), cex = 0.7)


# Model with MPG as dependent variable:

wt_inverse = 1/wt
wt_per_hp = wt/hp
disp_inverse = 1/disp
# All other variables are highly correlated with wt/wt_inverse

mpg_model = lm(mpg ~ wt_inverse + wt_per_hp  )
summary(mpg_model)
shapiro.test(mpg_model$residuals)

plot(wt_inverse, mpg_model$residual)      # to check if  mean = 0
plot(mpg, mpg_model$residuals)            # to check if variance constant



######################## Question No. 2 #################################

library(mlogit)
swissmetro = read.table('swissmetro-renamed.dat',header = TRUE)
swissmetro = swissmetro[swissmetro$CHOICE != 0,]
swissmetro = swissmetro[swissmetro$AGE != 6,]

swissmetro$CHOICE[swissmetro$CHOICE == 1] = 'TRAIN'
swissmetro$CHOICE[swissmetro$CHOICE == 2] = 'SM'
swissmetro$CHOICE[swissmetro$CHOICE == 3] = 'CAR'

# Creating dummy variables:

# LUGGAGE

swissmetro$LUGGAGE_none[swissmetro$LUGGAGE == 0] = 1
swissmetro$LUGGAGE_none[swissmetro$LUGGAGE != 0] = 0

swissmetro$LUGGAGE_one_piece[swissmetro$LUGGAGE == 1] = 1
swissmetro$LUGGAGE_one_piece[swissmetro$LUGGAGE != 1] = 0

# AGE

swissmetro$is_Old[swissmetro$AGE >= 5] = 1
swissmetro$is_Old[swissmetro$AGE < 5] = 0

# TICKET

swissmetro$is_Annual_Ticket[swissmetro$TICKET == 6 | swissmetro$TICKET == 7] = 1
swissmetro$is_Annual_Ticket[swissmetro$TICKET != 6 & swissmetro$TICKET != 7] = 0


# HEADWAY_diff (TRAIN & SM)

swissmetro$HEADWAY_diff = swissmetro$HE.SM - swissmetro$HE.TRAIN

# Defining Model:

swissmetro.wide = mlogit.data(swissmetro, varying = c(19,26,22, 20,27,23),
                        shape = "wide", choice = "CHOICE")


summary(mlogit(CHOICE ~ TT + CO | SURVEY + 
                 LUGGAGE_none + LUGGAGE_one_piece + 
                 is_Old + is_Annual_Ticket + GA  + HEADWAY_diff
                 , data = swissmetro.wide, reflevel = "CAR"))

        