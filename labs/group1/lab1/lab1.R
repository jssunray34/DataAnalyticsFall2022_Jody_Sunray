##################
#### EPI Data ####
##################

# Read in the data
EPI_data <- read.csv("2010EPI_data.csv")
View(EPI_data)

# Change the first row to be the header
names(EPI_data) <- as.matrix(EPI_data[1,])
EPI_data <- EPI_data[-1,]
EPI_data[] <- lapply(EPI_data, function(x) type.convert(as.character(x)))
EPI_data
View(EPI_data)

attach(EPI_data) # sets the 'default' object
fix(EPI_data) # launches a simple data editor
EPI # prints out values EPI_data$EPI
tf <- is.na(EPI) # records True values if the value is NA
E <- EPI[!tf] # filters out NA values, new array
E

####################
#### Exercise 1 ####
####################

####################
### EPI Variable ###
####################

# exploring the distribution
summary(EPI) # stats
fivenum(EPI, na.rm = TRUE)
stem(EPI)
hist(EPI)
hist(EPI, seq(30., 95., 1.0), prob = TRUE)
lines(density(EPI, na.rm = TRUE, bw = 1.)) # or try bw="SJ"
rug(EPI)

# fitting a distribution beyond histograms
plot(ecdf(EPI), do.points=FALSE, verticals=TRUE) # cumulative density function
# quantile-quantile
par(pty="s")
qqnorm(EPI); qqline(EPI)
# make a Q-Q plot against the generating distribution
x <- seq(30, 95, 1)
qqplot(qt(ppoints(250), df = 5), x, xlab = "Q-Q plot for t dsn")
qqline(x)

#####################
### DALY Variable ###
#####################

# exploring the distribution
summary(DALY) # stats
fivenum(DALY, na.rm = TRUE)
stem(DALY)
hist(DALY)
lines(density(DALY, na.rm = TRUE, bw = 1.)) # or try bw="SJ"
rug(DALY)

# fitting a distribution beyond histograms
plot(ecdf(DALY), do.points=FALSE, verticals=TRUE) # cumulative density function
# quantile-quantile
par(pty="s")
qqnorm(DALY); qqline(DALY)
# make a Q-Q plot against the generating distribution
x <- seq(30, 95, 1)
qqplot(qt(ppoints(250), df = 5), x, xlab = "Q-Q plot for t dsn")
qqline(x)

########################
### WATER_H Variable ###
########################

# exploring the distribution
summary(WATER_H) # stats
fivenum(WATER_H, na.rm = TRUE)
stem(WATER_H)
hist(WATER_H)
lines(density(WATER_H, na.rm = TRUE, bw = 1.)) # or try bw="SJ"
rug(WATER_H)

# fitting a distribution beyond histograms
plot(ecdf(WATER_H), do.points=FALSE, verticals=TRUE) # cumulative density function
# quantile-quantile
par(pty="s")
qqnorm(WATER_H); qqline(WATER_H)
# make a Q-Q plot against the generating distribution
x <- seq(30, 95, 1)
qqplot(qt(ppoints(250), df = 5), x, xlab = "Q-Q plot for t dsn")
qqline(x)

###############################
### Comparing Distributions ###
###############################

boxplot(EPI, DALY)
boxplot(EPI, WATER_H)
boxplot(DALY, WATER_H)

qqplot(EPI, DALY)
qqplot(EPI, WATER_H)
qqplot(DALY, WATER_H)

# inter-compare: EPI, ENVHEALTH, ECOSYSTEM, DALY, AIR_H, WATER_H,
# AIR_E, WATER_E, and BIODIVERSITY
boxplot(EPI, ENVHEALTH)
boxplot(AIR_H, AIR_E)
boxplot(WATER_H, WATER_E)

####################
#### Exercise 2 ####
####################

# filtering (populations)
# conditioning filtering
EPILand <- EPI[!Landlock]
ELand <- EPILand[!is.na(EPILand)]
ELand
hist(ELand)
hist(ELand, seq(30., 95., 1.0))

################################
#### Exercise 1 (revisited) ####
################################

####################
### EPI Variable ###
####################

# exploring the distribution
summary(ELand) # stats
fivenum(ELand, na.rm = TRUE)
stem(ELand)
hist(ELand)
hist(ELand, seq(30., 95., 1.0), prob = TRUE)
lines(density(ELand, na.rm = TRUE, bw = 1.)) # or try bw="SJ"
rug(ELand)

# fitting a distribution beyond histograms
plot(ecdf(ELand), do.points=FALSE, verticals=TRUE) # cumulative density function
# quantile-quantile
par(pty="s")
qqnorm(ELand); qqline(ELand)
# make a Q-Q plot against the generating distribution
x <- seq(30, 95, 1)
qqplot(qt(ppoints(250), df = 5), x, xlab = "Q-Q plot for t dsn")
qqline(x)

################################
#### Exercise 2 (revisited) ####
################################

# how to filter on EPI_regions or GEO_subregion?
# e.g., EPI_South_Asia <- EPI[<what is this>]
EPI_South_Asia <- EPI[EPI_regions=="South Asia"]
EPI_South_Asia

####################
#### GRUMP Data ####
####################

# Read in the data
GRUMP_data <- read.csv("GPW3_GRUMP_SummaryInformation_2010.csv")
View(GRUMP_data)

attach(GRUMP_data) # sets the 'default' object

####################
#### Exercise 1 ####
####################

#####################
### Area Variable ###
#####################

Area <- as.numeric(Area)

# exploring the distribution
summary(Area) # stats
fivenum(Area, na.rm = TRUE)
stem(Area)
hist(Area)
lines(density(Area, na.rm = TRUE, bw = 1.)) # or try bw="SJ"
rug(Area)

# fitting a distribution beyond histograms
plot(ecdf(Area), do.points=FALSE, verticals=TRUE) # cumulative density function
# quantile-quantile
par(pty="s")
qqnorm(Area); qqline(Area)
# make a Q-Q plot against the generating distribution
x <- seq(30, 95, 1)
qqplot(qt(ppoints(250), df = 5), x, xlab = "Q-Q plot for t dsn")
qqline(x)
