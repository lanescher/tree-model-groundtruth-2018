# read in marker data

setwd("C:/Users/lscher/Documents/Github/tree-model-groundtruth-2018")

# INPUT BRANCH NUMBER AND MODEL DATES
tree <- "memorialoak"
branch <- "01"
date1 <- "171221"
date2 <- "180109"

# read in files
model1 <- read.csv(paste("DATA/", tree, "_", date1, "_branch", branch, ".txt", 
                         sep = ""), sep = ",", header = TRUE, skip = 1)
model2 <-read.csv(paste("DATA/", tree, "_", date2, "_branch", branch, ".txt", 
                        sep = ""), sep = ",", header = TRUE, skip = 1)

# get rid of columns that you don't need
model1 <- model1[,-c(2:8)]
model2 <- model2[,-c(2:8)]

# find matching nodes
overlap <- merge(model1, model2, by = "X.Label")
overlap$node <- gsub("\\.", "*", overlap$X.Label)
overlap$node <- gsub("-", ".", overlap$node)
# the last column of this dataframe lists all the matching nodes

# find the nodes that are only in model1
model1.only <- setdiff(model1$X.Label, overlap$X.Label)
model1.only <- as.data.frame(model1.only)
model1.only$node <- gsub("\\.", "*", model1.only[,1])
model1.only$node <- gsub("-", ".", model1.only$node)
# the last column of this dataframe lists all the matching nodes

# find the nodes that are only in model2
model2.only <- setdiff(model2$X.Label, overlap$X.Label)
model2.only <- as.data.frame(model2.only)
model2.only$node <- gsub("\\.", "*", model2.only[,1])
model2.only$node <- gsub("-", ".", model2.only$node)
# the last column of this dataframe lists all the matching nodes

# make new dataframe with two columns, node and label, to combine with dfs for each model
both <- as.data.frame(overlap$node)
both$label <- "both"
names(both) <- c("node", "label")
# make new dataframe with same columns for model 1
model1.only.list <- as.data.frame(model1.only$node)
model1.only.list$label <- date1
names(model1.only.list) <- c("node", "label")
# make new dataframe with same columns for model 2
model2.only.list <- as.data.frame(model2.only$node)
model2.only.list$label <- date2
names(model2.only.list) <- c("node", "label")

# combine dfs into one
final <- rbind(both, model1.only.list, model2.only.list)

# write new csv with all nodes listed and label stating which models it is present in
write.csv(final, file = paste("DATA/", tree, "_", branch, "_merged.csv", sep = ""))



