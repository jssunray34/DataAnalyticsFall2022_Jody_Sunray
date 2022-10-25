#################
#### R_SVM.R ####
#################

## https://web.stanford.edu/group/wonglab/RSVMpage/R-SVM.html

## SVM example with Iris Data in R
## https://rischanlab.github.io/SVM.html

# Use library e1071, you can install it using install.packages(“e1071”). Load library
library("e1071")

# Using Iris data
head(iris,5)

# Attach the Data
attach(iris)

# Divide Iris data to x (containt the all features) and y only the classes
x <- subset(iris, select=-Species)
y <- Species

# Create SVM Model and show summary
svm_model <- svm(Species ~ ., data=iris)
summary(svm_model)

# Or you can use command like this
# Create SVM Model and show summary
svm_model1 <- svm(x,y)
summary(svm_model1)

# Run Prediction and you can measuring the execution time in R
pred <- predict(svm_model1,x)
system.time(pred <- predict(svm_model1,x))

# See the confusion matrix result of prediction, using command table to compare the result of SVM prediction and the class data in y variable.
table(pred,y)

# TUning SVM to find the best cost and gamma
svm_tune <- tune(svm, train.x=x, train.y=y, 
                 kernel="radial", ranges=list(cost=10^(-1:2), gamma=c(.5,1,2)))

print(svm_tune)

# After you find the best cost and gamma, you can create svm model again and try to run again
svm_model_after_tune <- svm(Species ~ ., data=iris, kernel="radial", cost=1, gamma=0.5)
summary(svm_model_after_tune)

# Run Prediction again with new model
pred <- predict(svm_model_after_tune,x)
system.time(predict(svm_model_after_tune,x))

# See the confusion matrix result of prediction, using command table to compare the result of SVM prediction and the class data in y variable.
table(pred,y)
