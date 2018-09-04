branch3real <- read.csv("../DATA/INPUT/memorialoak_measurements_real_branch03.csv",
                        skip = 3)

branch3real$node <- gsub("//..", "*", branch3real$node)
branch3real$node <- gsub("-", ".", branch3real$node)

start3 <- data.frame(c(1:3), c(1:3), c(1:3), c(1:3), c(1:3), c(1:3), 
                     c(1:3), c(1:3), c(1:3), c(1:3), c(1:3))

colnames(start3) <- colnames(branch3real)
branch3 <- rbind(start3, branch3real)

write.csv(branch3, "../DATA/INPUT/memorialoak_measurements_real_branch03-new.csv", row.names = FALSE)

branch5real <- read.csv("../DATA/INPUT/memorialoak_measurements_real_branch05.csv",
                        skip = 3)
branch5real$node <- gsub("[.]", "*", branch5real$node)
branch5real$node <- gsub("-", ".", branch5real$node)

start5 <- data.frame(c(1:3), c(1:3), c(1:3), c(1:3), c(1:3), c(1:3), 
                     c(1:3), c(1:3), c(1:3), c(1:3), c(1:3))

colnames(start5) <- colnames(branch5real)

colnames(start5) <- colnames(branch5real)
branch5 <- rbind(start5, branch5real)

write.csv(branch5, "../DATA/INPUT/memorialoak_measurements_real_branch05-new.csv", row.names = FALSE)
