####################################
#### Outliers_in_Data_Example.R ####
####################################

# load the cars dataset
data(cars)
cars1 <- cars[1:30,] # first 30 rows of the original cars dataset
head(cars1)

# now we will introduce some additional data points that are outliers
cars_outliers <- data.frame(speed=c(19,19,20,20,20), dist=c(190,186,210,220,218))
head(cars_outliers)

# bind outliers to rest of dataset
cars2 <- rbind(cars1, cars_outliers)
View(cars2)

# Set or Query Graphical Parameters - read the RStudio documentation for "par" function
help(par) 
par(mfrow=c(1, 2))

# plot of cars data with outliers
plot(cars2$speed, cars2$dist, xlim=c(0, 28), ylim=c(0, 230), main="With Outliers", xlab="speed", ylab="dist", pch="*", col="red", cex=2)
abline(lm(dist ~ speed, data=cars2), col="blue", lwd=3, lty=2)

# plot of original data without outliers (note the change in slope (angle) of best fit line)
plot(cars1$speed, cars1$dist, xlim=c(0, 28), ylim=c(0, 230), main="Outliers removed \n A much better fit!", xlab="speed", ylab="dist", pch="*", col="red", cex=2)
abline(lm(dist ~ speed, data=cars1), col="blue", lwd=3, lty=2)
