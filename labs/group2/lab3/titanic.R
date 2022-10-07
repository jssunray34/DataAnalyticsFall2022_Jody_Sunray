################
#### lab4.R ####
################

#############################
### Trees for the Titanic ###
#############################

data(Titanic)
View(Titanic)
head(Titanic)

# Titanic documentation
# https://www.rdocumentation.org/packages/titanic/versions/0.1.0

# create rpart
titanic_rpart <- rpart(Survived ~., data = Titanic)
titanic_rpart
rpart.plot(titanic_rpart)

# create ctree
titanic_ctree <- ctree(Survived ~., data = Titanic)
plot(titanic_ctree)

# create hclust
d <- dist(Titanic, method = "euclidean") # dissimilarity matrix
hc1 <- hclust(d, method = "complete") # hierarchical clustering using Complete Linkage
plot(hc1, cex = 0.6, hang = -1) # plot the obtained dendrogram
