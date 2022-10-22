# Cook's Distance example using mtcars
mtcars
head(mtcars)
str(mtcars)
model1 <- lm(mpg ~ cyl + wt, data = mtcars)
model1
help("cooks.distance")
plot(model1, pch = 18, col = 'red', which = c(4))

# we can use the cooks.distance() function to identify the Cook's distance to
# each observation
cooks.distance(model1)
CooksDistance <- cooks.distance(model1)

# Now we will round off the values to 5 decimal points so that it is easy to read
# we can use the round() function to round off values in R.
round(CooksDistance, 5)
# we can sort the values in ascending order
sort(round(CooksDistance, 5))
