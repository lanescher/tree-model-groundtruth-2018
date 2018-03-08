# read in node names to find corresponding nodes in multiple models

# read in files
##### change branch number here
branch10.171221 <- read.csv("C:/Users/lscher/Documents/Tree Observatory/3D model analysis/data/branchdata/171221_branch13.txt", sep = ",", header = TRUE, skip = 1)
branch10.180109 <- read.csv("C:/Users/lscher/Documents/Tree Observatory/3D model analysis/data/branchdata/180109_branch13.txt", sep = ",", header = TRUE, skip = 1)

# remove unneeded columns
branch10.171221[,2:8] <- NULL
branch10.180109[,2:8] <- NULL

# find matching nodes
branch10all <- merge(branch10.171221, branch10.180109, by = "X.Label", incomparables = TRUE)
branch10all$node <- gsub("\\.", "*", branch10all$X.Label)
branch10all$node <- gsub("-", ".", branch10all$node)
# first column has all matching points

# find first date only
branch10.171221.only <- setdiff(branch10.171221$X.Label, branch10all$X.Label)
branch10.171221.only <- as.data.frame(branch10.171221.only)
branch10.171221.only$node <- gsub("\\.", "*", branch10.171221.only[,1])
branch10.171221.only$node <- gsub("-", ".", branch10.171221.only$node)

# find second date only
branch10.180109.only <- setdiff(branch10.180109$X.Label, branch10all$X.Label)
branch10.180109.only <- as.data.frame(branch10.180109.only)
branch10.180109.only$node <- gsub("\\.", "*", branch10.180109.only[,1])
branch10.180109.only$node <- gsub("-", ".", branch10.180109.only$node)

# write all files

##### change branch number here
write.csv(branch10all, file = "C:/Users/lscher/Documents/Tree Observatory/3D model analysis/data/branchdata/branch13_both.csv")
write.csv(branch10.171221.only, file = "C:/Users/lscher/Documents/Tree Observatory/3D model analysis/data/branchdata/branch13_171221.csv")
write.csv(branch10.180109.only, file = "C:/Users/lscher/Documents/Tree Observatory/3D model analysis/data/branchdata/branch13_180109.csv")


