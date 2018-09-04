# add branch column

comb.all.data$branchname <- comb.all.data$node
comb.all.data$branchname <- paste0(comb.all.data$branchname, ".")
comb.all.data$branchname <- gsub("\\..*", "", comb.all.data$branchname)

# add tree+branch column
comb.all.data$treebranch <- paste0(substr(comb.all.data$tree,1,1), "_", comb.all.data$branchname)

boxplot(comb.all.data$perror.avg[which(comb.all.data$measurement == "diameter")] ~ 
          comb.all.data$treebranch[which(comb.all.data$measurement == "diameter")])

ggplot(data = subset(comb.all.data, comb.all.data$measurement == "diameter"), 
       aes(x = comb.all.data$treebranch[which(comb.all.data$measurement == "diameter")],
           y = comb.all.data$perror.avg[which(comb.all.data$measurement == "diameter")])) +
  geom_boxplot()
  
