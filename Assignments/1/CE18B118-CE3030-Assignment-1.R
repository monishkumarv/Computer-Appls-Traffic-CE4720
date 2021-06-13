# 2.a
summary(c(8,14,18,19,25,9,8))
summary(c(6,10,13,19,31,11,11))
summary(c(2,4,4,11,39,18,21))

# 2.b
yr_1960 = c(8,14,18,19,25,9,8)
yr_1970 = c(6,10,13,19,31,11,11)
yr_1991 = c(2,4,4,11,39,18,21)
school_yrs = c('0-5','5-8', '8-9', '9-12', '12-13', '13-16', '>16')
education_levels_data = data.frame(school_yrs, yr_1960, yr_1970, yr_1991)

# 2.c
barplot(yr_1991) # class intervals are not uniform

# better way is to have school_yrs as x axis
class_len = c(5,3,1,3,1,3,6)
yr_1960_adjusted = rep(c(yr_1960/class_len), class_len)
yr_1970_adjusted = rep(c(yr_1970/class_len), class_len)
yr_1991_adjusted = rep(c(yr_1991/class_len), class_len)

# 2.e
intervals = c('0-1','1-2','2-3','3-4','4-5','6-7','7-8','8-9','9-10','10-11','11-12','12-13',
              '13-14','14-15','15-16','16-17','17-18','18-19','19-20','20-21','21-22')
names(yr_1960_adjusted) = intervals
names(yr_1970_adjusted) = intervals
names(yr_1991_adjusted) = intervals

barplot(yr_1960_adjusted)
barplot(yr_1970_adjusted)
barplot(yr_1991_adjusted)


# 3.a
typeof(UCBAdmissions)
class(UCBAdmissions)

# 3.b
ucb_data = data.frame(UCBAdmissions)

# 3.c
attach(ucb_data)
percent_male_admitted = sum(Freq[Gender == 'Male' & Admit == 'Admitted']) / sum(Freq) * 100
percent_male_rejected = sum(Freq[Gender == 'Male' & Admit != 'Admitted']) / sum(Freq) * 100
percent_female_admitted = sum(Freq[Gender == 'Female' & Admit == 'Admitted']) / sum(Freq) * 100
percent_female_rejected = sum(Freq[Gender == 'Female' & Admit != 'Admitted']) / sum(Freq) * 100

# 3.d
temp = aggregate(Freq[Gender == 'Male'], by=list(Dept[Gender == 'Male']), FUN = sum)
male_count = temp$x
temp = aggregate(Freq[Gender == 'Female'], by=list(Dept[Gender == 'Female']), FUN = sum)
female_count = temp$x

temp = aggregate(Freq[Gender == 'Male' & Admit == 'Admitted'], by=list(Dept[Gender == 'Male' & Admit == 'Admitted']), FUN = sum)
percent_male_admitted = temp$x / male_count * 100
temp = aggregate(Freq[Gender == 'Female' & Admit == 'Admitted'], by=list(Dept[Gender == 'Female' & Admit == 'Admitted']), FUN = sum)
percent_female_admitted = temp$x / female_count * 100

ucb_grouped_data = data.frame(levels(factor(Dept)), male_count, percent_male_admitted, female_count, percent_female_admitted)
detach(ucb_data)

# 4.a
airquality_data = data.frame(airquality)
summary(airquality_data)
attach(airquality_data)

# 4.b
mean(Ozone)
mean(Ozone[!is.na(Ozone)])

# 4.c
require(gmodels)
CrossTable(cut(Ozone, 5), cut(Wind, 5))

# 4.d
CrossTable(cut(Ozone, 5), cut(Temp, 5))
CrossTable(cut(Ozone, 5), cut(Solar.R, 5))

# 4.e
cor(Ozone[!is.na(Ozone)], Wind[!is.na(Ozone)])
cor(Ozone[!is.na(Ozone)], Temp[!is.na(Ozone)])
cor(Ozone[!is.na(Ozone) & !is.na(Solar.R)], Solar.R[!is.na(Ozone) & !is.na(Solar.R)])

# 4.f
is.weekend = c(0,0,0,0,1,1,0) # ("Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday","Monday")
is.weekend = rep(is.weekend, times=100)
length(is.weekend) = nrow(airquality_data)

summary(Ozone[is.weekend == 0 & !is.na(Ozone)])
summary(Ozone[is.weekend == 1 & !is.na(Ozone)])

detach(airquality_data)

# 4.g
boxplot(Ozone[Month == 5 | Month == 9], Month[Month == 5 | Month == 9])

# 5.a
hist(faithful$eruptions, 50)
# 5.b
plot(density(faithful$eruptions, bw = 0.2))
# 5.c
plot(faithful$eruptions, faithful$waiting)
# 5.d
plot(AirPassengers)
# 5.e
boxplot(InsectSprays$count,InsectSprays$spray)
# 5.f
barplot(GNP ~ Year, data = longley)
# 5.g
pie(rep(1, 5), radius = 1.5)

# 6
attach(airquality)

year = rep(1973, times = nrow(airquality))  # May to September 1973
date = paste(year, Month, sep = "-")
date = paste(date, Day, sep = "-")

day_of_week = weekdays(as.Date(date))
day_of_week[day_of_week == 'Saturday' | day_of_week == 'Sunday'] = 'Weekend'
day_of_week[day_of_week != 'Weekend'] = 'Weekday'

require(ggplot2)  # (or) use library(ggplot2)
qplot(Ozone, Temp, colour = day_of_week)

detach(airquality)

# 7
swiss_data = data.frame(swiss)
attach(swiss_data)
quantile(Education, 0.05)
quantile(Education, 0.10)
quantile(Education, 0.75)

plot(density(Education))
plot(ecdf(Education), do.points=FALSE, verticals = TRUE)

# 8
co2_data = data.frame(CO2)
attach(co2_data)

cov(conc, uptake)
cor(conc, uptake)

detach(co2_data)