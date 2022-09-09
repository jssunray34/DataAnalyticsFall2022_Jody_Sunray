# Creating a dataframe
# Example: RPI Weather dataframe

days <- c('Mon', 'Tue', 'Wed', 'Thur', 'Fri', 'Sat', 'Sun') # days
temp <- c(28, 30.5, 32, 31.2, 29.3, 27.9, 26.4) # Temperature in F during the winter
snowed <- c('T', 'T', 'F', 'F', 'T', 'T', 'F') # Snowed on that day: T = TRUE, F = FALSE
snowed
help("data.frame")

emptyDataframe <- data.frame()
RPI_Weather_Week <- data.frame(days, temp, snowed) # Creating the dataframe using the data.frame() function
RPI_Weather_Week

head(RPI_Weather_Week)
str(RPI_Weather_Week)
summary(RPI_Weather_Week$temp)

RPI_Weather_Week[1,]
RPI_Weather_Week[,1]

RPI_Weather_Week[,'snowed']
RPI_Weather_Week[,'days']
RPI_Weather_Week[,'temp']
RPI_Weather_Week[1:5,c("days", "temp")]
RPI_Weather_Week$temp
subset(RPI_Weather_Week,subset=snowed==TRUE)

sorted.snowed