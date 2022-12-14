######################
#### lab1_kknn1.R ####
######################

install.packages("kknn")

# performs k-nearest neighbor classification of a test set using a training set
require(kknn)

data(iris)
m <- dim(iris)[1]

# create training and testing sets from iris data
val <- sample(1:m, size = round(m/3), replace = FALSE, prob = rep(1/m, m)) 
iris.learn <- iris[-val,]
iris.valid <- iris[val,]

# perform kknn
iris.kknn <- kknn(Species~., iris.learn, iris.valid, distance = 1, kernel = "triangular")
summary(iris.kknn)
fit <- fitted(iris.kknn)
table(iris.valid$Species, fit)
pcol <- as.character(as.numeric(iris.valid$Species))
pairs(iris.valid[1:4], pch = pcol, col = c("green3", "red")[(iris.valid$Species != fit)+1])
