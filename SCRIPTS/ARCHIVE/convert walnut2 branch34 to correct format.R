branch3 <- read.csv("../DATA/INPUT/walnut2_measurements_real_branch03.csv", skip = 3)

# diameter and length to numeric
branch3$diameter <- as.numeric(as.character(branch3$diameter))
branch3$diameter.1 <- as.numeric(as.character(branch3$diameter.1))
branch3$length <- as.numeric(as.character(branch3$length))
branch3$length.1 <- as.numeric(as.character(branch3$length.1))

# node labels to chr
branch3$node <- as.character(branch3$node)
branch3$to.node <- as.character(branch3$to.node)
branch3$to.node.1 <- as.character(branch3$to.node.1)

# X to chr
branch3$X <- as.character(branch3$X)
branch3$X.1 <- as.character(branch3$X.1)
branch3$X.2 <- as.character(branch3$X.2)
branch3$b <- as.character(branch3$b)

start3 <- data.frame(c(1:3), c(1:3), c(1:3), c(1:3), c(1:3), c(1:3), 
                     c(1:3), c(1:3), c(1:3), c(1:3), c(1:3))

colnames(start3) <- colnames(branch3)

branch3 <- rbind(start3, branch3)

write.csv(branch3, "../DATA/INPUT/walnut2_measurements_real_branch03-new.csv", row.names = FALSE)


#### Now branch 4

branch4 <- read.csv("../DATA/INPUT/walnut2_measurements_real_branch04.csv", skip = 3)


# diameter and length to numeric
branch4$diameter <- as.numeric(as.character(branch4$diameter))
branch4$diameter.1 <- as.numeric(as.character(branch4$diameter.1))
branch4$length <- as.numeric(as.character(branch4$length))
branch4$length.1 <- as.numeric(as.character(branch4$length.1))

# node labels to chr
branch4$node <- as.character(branch4$node)
branch4$to.node <- as.character(branch4$to.node)
branch4$to.node.1 <- as.character(branch4$to.node.1)

# X to chr
branch4$X <- as.character(branch4$X)
branch4$X.1 <- as.character(branch4$X.1)
branch4$X.2 <- as.character(branch4$X.2)
branch4$X.3 <- as.character(branch4$X.3)

start4 <- data.frame(c(1:3), c(1:3), c(1:3), c(1:3), c(1:3), c(1:3), 
                     c(1:3), c(1:3), c(1:3), c(1:3), c(1:3))

colnames(start4) <- colnames(branch4)

branch4 <- rbind(start4, branch4)

write.csv(branch4, "../DATA/INPUT/walnut2_measurements_real_branch04-new.csv", row.names = FALSE)
