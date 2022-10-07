######################
#### lab1_kknn2.R ####
######################

require(kknn)
data(ionosphere)

# create training and testing sets from ionosphere data
ionosphere.learn <- ionosphere[1:200,]
ionosphere.valid <- ionosphere[-c(1:200),]

# perform kknn
fit.kknn <- kknn(class ~ ., ionosphere.learn, ionosphere.valid)

# create confusion matrix
table(ionosphere.valid$class, fit.kknn$fit)

?train.kknn

# train learning set with distance 1
(fit.train1 <- train.kknn(class ~ ., ionosphere.learn, kmax = 15, 
	kernel = c("triangular", "rectangular", "epanechnikov", "optimal"), distance = 1))
table(predict(fit.train1, ionosphere.valid), ionosphere.valid$class)

# train learning set with distance 2
(fit.train2 <- train.kknn(class ~ ., ionosphere.learn, kmax = 15, 
	kernel = c("triangular", "rectangular", "epanechnikov", "optimal"), distance = 2))
table(predict(fit.train2, ionosphere.valid), ionosphere.valid$class)
