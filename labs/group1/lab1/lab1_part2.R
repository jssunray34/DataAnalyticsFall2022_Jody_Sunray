######################
#### Lab 1 Part 2 ####
######################

# linear basis and least-squares constraints
multivariate <- read.csv("multivariate.csv")
View(multivariate)
head(multivariate)
attach(multivariate)
help(lm)
mm <- lm(Homeowners~Immigrant)
mm
summary(mm)
plot(Homeowners~Immigrant)

help(abline)
abline(mm)
abline(mm, col=2, lwd=3)
attributes(mm)
mm$coefficients

library(tidyverse)
newImmigrantData <- data.frame(Immigrant = c(0, 20))
mm %>% predict(newImmigrantData)

# creating plots
# chapter 2 -- R graphics cookbook
plot(mtcars$wt, mtcars$mpg)
library(ggplot2)
qplot(mtcars$wt, mtcars$mpg)
qplot(wt, mpg, data = mtcars)
ggplot(mtcars, aes(x=wt, y=mpg)) + geom_point()
plot(pressure$temperature, pressure$pressure, type = "l")
points(pressure$temperature, pressure$pressure)

lines(pressure$temperature, pressure$pressure/2, col="red")
points(pressure$temperature, pressure$pressure/2, col="blue")
library(ggplot2)
qplot(pressure$temperature, pressure$pressure, geom="line")
qplot(temperature, pressure, data = pressure, geom = "line")
ggplot(pressure, aes(x=temperature, y=pressure)) + geom_line() + geom_point()

# creating bar graphs
barplot(BOD$demand, names.arg = BOD$Time)
table(mtcars$cyl)
barplot(table(mtcars$cyl)) # generate a table of counts
qplot(mtcars$cyl) # cyl is continuous here
qplot(factor(mtcars$cyl)) # treat cyl as discrete

# bar graph of counts
qplot(factor(cyl), data = mtcars)
ggplot(mtcars, aes(x = factor(cyl))) + geom_bar()

# creating histograms using ggplot
# view the distribution of one-dimensional data with a histogram
hist(mtcars$mpg)
hist(mtcars$mpg, breaks = 10) # specify approximate number of bins with breaks
hist(mtcars$mpg, breaks = 5)
hist(mtcars$mpg, breaks = 12)
qplot(mpg, data = mtcars, binwidth = 4)
ggplot(mtcars, aes(x=mpg)) + geom_histogram(binwidth = 4)
ggplot(mtcars, aes(x=mpg)) + geom_histogram(binwidth = 5)

# creating boxplots using ggplot
plot(ToothGrowth$supp, ToothGrowth$len) # using plot() function and pass it a factor of x-values and a vector of y-values
# formula syntax
boxplot(len ~ supp, data = ToothGrowth) # if the two vectors are in the same dataframe, you can use the formula syntax
# with this syntax you can combine two variables on the x-axis
# put interaction of two variables on x-axis
boxplot(len ~ supp + dose, data = ToothGrowth)
# with ggplot2 you can get the same results above
library(ggplot2)
qplot(ToothGrowth$supp, ToothGrowth$len, geom = "boxplot")
# if the two vectors are in the same dataframe, you can use the following syntax
qplot(supp, len, data = ToothGrowth, geom = "boxplot")
# in ggplot2, the above is equivalent to:
ggplot(ToothGrowth, aes(x=supp, y=len)) + geom_boxplot()
# using three vectors
qplot(interaction(ToothGrowth$supp, ToothGrowth$dose), ToothGrowth$len, geom = "boxplot")
# you can write the same thing above, get the columns from the dataframe
qplot(interaction(supp, dose), len, data = ToothGrowth, geom = "boxplot")
# using ggplot() you can do the same thing and it is equivalent to:
ggplot(ToothGrowth, aes(x=interaction(supp, dose), y=len)) + geom_boxplot()
# plotting a function curve
