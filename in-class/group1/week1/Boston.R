install.packages("MASS")
library(MASS)
attach(Boston)
?Boston
head(Boston) # shows first 6 rows of data frame
dim(Boston) # shows number of rows and columns
nrow(Boston)
ncol(Boston)
names(Boston) # shows column names
str(Boston) # shows structure of the data frame
summary(Boston) # shows min, max, quartiles, median
Boston$crim # shows all data for crim column
summary(Boston$tax)
