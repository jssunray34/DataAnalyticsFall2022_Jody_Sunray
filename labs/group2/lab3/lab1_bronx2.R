#######################
#### lab1_bronx2.R ####
#######################

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
str(bronx1)

# convert data types
bronx1$SALE.PRICE <- sub("\\$","",bronx1$SALE.PRICE)
bronx1$SALE.PRICE <- as.numeric(gsub(",","", bronx1$SALE.PRICE)) 
bronx1$GROSS.SQUARE.FEET <- as.numeric(gsub(",","", bronx1$GROSS.SQUARE.FEET)) 
bronx1$LAND.SQUARE.FEET <- as.numeric(gsub(",","", bronx1$LAND.SQUARE.FEET)) 
bronx1$SALE.DATE <- as.Date(gsub("[^]:digit:]]","",bronx1$SALE.DATE)) 
bronx1$YEAR.BUILT <- as.numeric(gsub("[^]:digit:]]","",bronx1$YEAR.BUILT)) 
bronx1$ZIP.CODE <- as.character(gsub("[^]:digit:]]","",bronx1$ZIP.CODE))
str(bronx1)

# only keep rows where SALE.PRICE >= 10000
minprice <- 10000
bronx1 <- bronx1[which(bronx1$SALE.PRICE >= minprice),]
View(bronx1)
nval <- dim(bronx1)[1] # number of rows

# remove spaces from address
bronx1$ADDRESSONLY<- gsub("[,][[:print:]]*", "", gsub("[ ]+", "", trim(bronx1$ADDRESS)))
View(bronx1)

# create data frame only containing address and zip code
bronxadd<-unique(data.frame(bronx1$ADDRESSONLY, bronx1$ZIP.CODE, stringsAsFactors=FALSE))
View(bronxadd)

# rename column names
names(bronxadd) <- c("ADDRESSONLY","ZIP.CODE")

# put rows in order by address (alphabetically)
bronxadd <- bronxadd[order(bronxadd$ADDRESSONLY),]
View(bronxadd)

# determines whether there are duplicated addresses
duplicates <- duplicated(bronx1$ADDRESSONLY)
duplicates

# create a vector of the duplicate addresses
for(i in 1:2345) {
  if (duplicates[i] == FALSE) dupadd <- bronxadd[duplicates,1]
}

# take a sample of 450 addresses
nsample = 450
addsample <- bronxadd[sample.int(dim(bronxadd), size=nsample),]

library(ggmap)

# append "NY" to address and "US" to zip code
addrlist<-paste(addsample$ADDRESSONLY, "NY", addsample$ZIP.CODE, "US", sep=" ")

# this sets your Google map for this session
register_google(key = "AIzaSyCfVlR_f5VtFw3RjNWJg2vJbF81-77139M")
has_google_key()
google_key()

querylist<-geocode(addrlist) # getting error: This API project is not authorized to use this API
