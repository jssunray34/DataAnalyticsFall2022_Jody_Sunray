# Fitting a Regression Trees
library(MASS)
library(tree)
set.seed(1)
help("Boston") # Read the documentation for the Boston Dataset.
head(Boston)
dim(Boston)
train = sample(1:nrow(Boston), nrow(Boston)/2)
# medv = median value of owner-occupied homes in \$1000s.( Read the documentation)
tree.boston = tree(medv ~., Boston, subset = train)
summary(tree.boston)
# Note that the output summary() indicates that only three of the variables have been 
# used to constructing the tree. In the context of a regression tree,  
# the deviance is simply the sum of squared errors for the tree.

# Regression Tree
tree(formula = medv ~. , data = Boston, subset = train)
# We now plot the tree
plot(tree.boston)
text(tree.boston, pretty = 0)
# The variable "lstat" measure the percentage of the individuals with lower socioeconimics status.
# The tree indicates that the lower values of lstat corresponds to more inexpensive houese.
# Now we use the cv.tree() function to see whether pruning the tree will 
# improve performance.
help("cv.tree")
cv.boston=cv.tree(tree.boston)
plot(cv.boston$size ,cv.boston$dev ,typ ='b')

#In this case, the most complex tree is selected by cross-validation.
# However, if we wish to prune the tree, we could do so as follows, 
#using the prune.tree() function
help("prune.tree") # Read the documentation of the prune.tree() function.
prune.boston=prune.tree(tree.boston ,best=5)
# best= integer requesting the size (i.e. number of terminal nodes) of a specific 
# subtree in the cost-complexity sequence to be returned. 
# This is an alternative way to select a subtree than by supplying a scalar cost-complexity parameter k.
# If there is no tree in the sequence of the requested size, the next largest is returned.
plot(prune.boston)
text(prune.boston ,pretty=0)


# In keeping with the cross-validation results,
# we use the unpruned tree to make predictions on the test set.
yhat=predict(tree.boston ,newdata=Boston[-train ,])
boston.test=Boston[-train ,"medv"]
plot(yhat,boston.test)
# adding the abline()
abline(0,1)
mean((yhat-boston.test)^2)
# In other words, the test set MSE associated with the regression tree is 25.05.
# The square root of the MSE is therefore around 5.005,
# indicating that this model leads to test predictions that 
# are within around $5005 of the true median home value for the suburb.
sqrt(25.04559)

