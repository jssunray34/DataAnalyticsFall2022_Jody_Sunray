#######################
#### lab1_bronx1.R ####
#######################

library(gdata)

# read excel file
library("readxl")
help("read_excel")
bronx1 <- read_xls("rollingsales_bronx.xls", sheet = 1, skip = 4)
View(bronx1)

# attach default
attach(bronx1)

# rename column names
names(bronx1) <- gsub(" ", ".", names(bronx1))
names(bronx1) <- gsub("\n", ".", names(bronx1))
View(bronx1)

# convert data types
SALE.PRICE<-sub("\\$","",SALE.PRICE)
SALE.PRICE<-as.numeric(gsub(",","", SALE.PRICE))
GROSS.SQUARE.FEET<-as.numeric(gsub(",","", GROSS.SQUARE.FEET))
LAND.SQUARE.FEET<-as.numeric(gsub(",","", LAND.SQUARE.FEET))

# get log of SALE.PRICE and remove infinite values
log.SALE.PRICE<-log(SALE.PRICE)
log.SALE.PRICE<-log.SALE.PRICE[!is.na(log.SALE.PRICE) & !is.infinite(log.SALE.PRICE)]

# get log of GROSS.SQUARE.FEET and remove infinite values
log.GROSS.SQUARE.FEET<-log(GROSS.SQUARE.FEET)
log.GROSS.SQUARE.FEET<-log.GROSS.SQUARE.FEET[!is.na(log.GROSS.SQUARE.FEET) & !is.infinite(log.GROSS.SQUARE.FEET)]

# get log of LAND.SQUARE.FEET and remove infinite values
log.LAND.SQUARE.FEET<-log(LAND.SQUARE.FEET)
log.LAND.SQUARE.FEET<-log.LAND.SQUARE.FEET[!is.na(log.LAND.SQUARE.FEET) & !is.infinite(log.LAND.SQUARE.FEET)]

# plot log of GROSS.SQUARE.FEET against log of SALE.PRICE
plot(log(GROSS.SQUARE.FEET), log(SALE.PRICE))

###############
### Model 1 ###
###############

# create linear model for SALE.PRICE based on GROSS.SQUARE.FEET
m1 <- lm(log.SALE.PRICE~log.GROSS.SQUARE.FEET[1:3589])
summary(m1)
abline(m1,col="red",lwd=2)
plot(resid(m1))

###############
### Model 2 ###
###############

m2 <- lm(log.SALE.PRICE~log.GROSS.SQUARE.FEET[1:3589]+log.LAND.SQUARE.FEET[1:3589]+factor(bronx1$NEIGHBORHOOD[1:3589]))
summary(m2)
plot(resid(m2))

# suppress intercept - using "0+..."
m2a <- lm(log.SALE.PRICE~0+log.GROSS.SQUARE.FEET[1:3589]+log.LAND.SQUARE.FEET[1:3589]+factor(bronx1$NEIGHBORHOOD[1:3589]))
summary(m2a)
plot(resid(m2a))

###############
### Model 3 ###
###############

m3 <- lm(log.SALE.PRICE~0+log.GROSS.SQUARE.FEET[1:3589]+log.LAND.SQUARE.FEET[1:3589]+factor(bronx1$NEIGHBORHOOD[1:3589])+factor(bronx1$BUILDING.CLASS.CATEGORY[1:3589]))
summary(m3)
plot(resid(m3))

###############
### Model 4 ###
###############

m4 <- lm(log.SALE.PRICE~0+log.GROSS.SQUARE.FEET[1:3589]+log.LAND.SQUARE.FEET[1:3589]+factor(bronx1$NEIGHBORHOOD[1:3589])*factor(bronx1$BUILDING.CLASS.CATEGORY[1:3589]))
summary(m4)
plot(resid(m4))
