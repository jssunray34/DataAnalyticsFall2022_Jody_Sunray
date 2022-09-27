# Decision Trees --
# Classification Tree
# Install the following libraries/packages
library(rpart)
library(rpart.plot)

iris
dim(iris)

# creating a sample from the iris dataset
s_iris <- sample(150,100)
s_iris
help(sample)

# create testing and training sets
iris_train <- iris[s_iris,]
iris_test <- iris[-s_iris,]
dim(iris_train)
dim(iris_test)

# generate the decision tree model
decisionTreeModel <- rpart(Species~., iris_train, method = "class") # ~. includes remaining columns in data frame
# equivalent: decisionTreeModel <- rpart(Species~Sepal.Length+Sepal.Width+Petal.Length+Petal.Width, iris_train, method = "class")
decisionTreeModel

# plotting the decision tree model using 
rpart.plot(decisionTreeModel)
