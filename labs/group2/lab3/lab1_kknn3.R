######################
#### lab1_kknn3.R ####
######################

data(swiss)

pairs(~ Fertility + Education + Catholic, data = swiss, subset = Education < 20, main = "Swiss data, Education < 20")

# performs k-nearest neighbor classification of a test set using a training set
require(kknn)

m <- dim(swiss)[1]

# create training and testing sets from iris data
val <- sample(1:m, size = round(m/3), replace = FALSE, prob = rep(1/m, m)) 
swiss.learn <- swiss[-val,]
swiss.valid <- swiss[val,]

# perform kknn
swiss.kknn <- kknn(Fertility~., swiss.learn, swiss.valid, distance = 1, kernel = "triangular")
summary(swiss.kknn)
fit <- fitted(swiss.kknn)
table(swiss.valid$Fertility, fit)
pcol <- as.character(as.numeric(swiss.valid$Fertility))
pairs(swiss.valid[1:4], pch = pcol, col = c("green3", "red")[(swiss.valid$Fertility != fit)+1])

