# read in marker data
# test
setwd("C:/Users/lscher/Documents/Github/tree-model-groundtruth-2018")

# INPUT BRANCH NUMBER AND MODEL DATES
tree <- "elm"
branch <- c("01", "02", "03", "04", "10", "14", "15")
date1 <- "180222"
date2 <- "180323"

i <- 1
for (i in 1:length(branch)) {
  # read in files
  model1 <- read.csv(paste("DATA/INPUT/", tree, "_", date1, "_branch", branch[i], ".txt", 
                         sep = ""), sep = ",", header = TRUE, skip = 1)
  model2 <-read.csv(paste("DATA/INPUT/", tree, "_", date2, "_branch", branch[i], ".txt", 
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
  ?rbind
  # make new dataframe with two columns, node and label, to combine with dfs for each model
  both <- as.data.frame(overlap$node)
  both$label <- "both"
  names(both) <- c("node", "label")
  # make new dataframe with same columns for model 1
  model1.only.list <- as.data.frame(model1.only$node)
  if (length(model1.only.list$node) < 1) {
    model1.only.list <- rbind(model1.only.list, "none")
  }
  model1.only.list$label <- date1
  names(model1.only.list) <- c("node", "label")
  # make new dataframe with same columns for model 2
  model2.only.list <- as.data.frame(model2.only$node)
  if (length(model2.only.list$node) < 1) {
    model2.only.list <- rbind(model2.only.list, "none")
  }
  model2.only.list$label <- date2
  names(model2.only.list) <- c("node", "label")

  # combine dfs into one
  final <- rbind(both, model1.only.list, model2.only.list)

  # write new csv with all nodes listed and label stating which models it is present in
  write.csv(final, file = paste("DATA/OUTPUT/", tree, "_", branch[i], "_merged.csv", sep = ""))
  
  i <- i + 1
  
}


i <- 1
for (i in 1:length(branch)) {
  # read in files
  model1 <- read.csv(paste("DATA/INPUT/", tree, "_", date1, "_branch", branch[i], ".txt", 
                           sep = ""), sep = ",", header = TRUE, skip = 1)
  model2 <-read.csv(paste("DATA/INPUT/", tree, "_", date2, "_branch", branch[i], ".txt", 
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
  ?rbind
  # make new dataframe with two columns, node and label, to combine with dfs for each model
  both <- as.data.frame(overlap$node)
  both$label <- "both"
  names(both) <- c("node", "label")
  # make new dataframe with same columns for model 1
  model1.only.list <- as.data.frame(model1.only$node)
  if (length(model1.only.list$node) < 1) {
    model1.only.list <- rbind(model1.only.list, "none")
  }
  model1.only.list$label <- date1
  names(model1.only.list) <- c("node", "label")
  # make new dataframe with same columns for model 2
  model2.only.list <- as.data.frame(model2.only$node)
  if (length(model2.only.list$node) < 1) {
    model2.only.list <- rbind(model2.only.list, "none")
  }
  model2.only.list$label <- date2
  names(model2.only.list) <- c("node", "label")
  
  # combine dfs into one
  final <- rbind(final, both, model1.only.list, model2.only.list)
  
  i <- i + 1
  
}


names(final) <- c("X.Label", "isin")
final$X.Label <- gsub("[.]", "-", final[,1])
final$X.Label <- gsub("[*]", ".", final[,1])

