install.packages("ISLR")
library(ISLR)
data("Auto")
head(Auto)
summary(Auto$mpg)
fivenum(Auto$mpg)
hist(Auto$mpg)
mean(Auto$weight)
median(Auto$horsepower)
