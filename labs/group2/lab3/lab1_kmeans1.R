########################
#### lab1_kmeans1.R ####
########################

data(swiss)

?kmeans
sclass <- kmeans(swiss[2:6], 3)
table(sclass$cluster, swiss[,1])
