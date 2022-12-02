# Fitting a curve to the data
# Local regression or local polynomial regression, also known as moving regression is a generalization
# of moving average and polynomial regression. It is one of the most common methods,
# initially developed for scatterplot smoothing, are LOESS (locally estimated scatterplot smoothing) and
# LOWESS (locally weighted scatterplot smoothing),
# LOWESS example using the Cars dataset
data("cars")

str(cars) # we see 50 observation and 2 variables
# now we create a plot, speed Vs distance
plot(speed ~ dist, data = cars)
# When we look at the plot, we see that there is a positive relationship between these two variables

# Read the documentation for the lowess function in RStudio
help("lowess")
# Now we will use the lowess() function

# Now we will use the lowess() function
lowess(cars$speed ~ cars$dist)
# Now we will use the lowess() function along with the line() function
# to draw the lines
lines(lowess(cars$speed ~ cars$dist, f=2/3), col="blue")
# here the f value is the the smoother span. f= 2/3 = 0.666
# the default value for smoother span is 0.666 in RStudio.

#This gives the proportion of points in the plot which influence the smooth at each value.
# Larger values give more smoothness.
# Change the "f" value and observe the shape of the line.
# lines(lowess(cars$speed ~ cars$dist, f=0.75), col="gray") # f = 0.75
lines(lowess(cars$speed ~ cars$dist, f=0.8), col="red") # f = 0.8
lines(lowess(cars$speed ~ cars$dist, f=0.9), col="green") # f = 0.9
lines(lowess(cars$speed ~ cars$dist, f=0.1), col= 5) # f = 0.1
lines(lowess(cars$speed ~ cars$dist, f=0.01), col= 6) # f = 0.01
# Observe that, when we try to have a very lower values for "f", in this example, it will try to overfit points.