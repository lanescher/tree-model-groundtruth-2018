### find measurements with big errors
d.small <- d.all.data[which(d.all.data$value.real <= 5),]
d.large <- d.all.data[which(d.all.data$value.real > 5),]

# large diameters with perror > 100
bige1 <- as.data.frame(d.large$node[which(abs(d.large$perror.date1) > 100)])
bige1$tree <- d.large$tree[which(abs(d.large$perror.date1) > 100)]
bige1$date <- "date1"
bige1$branch <- d.large$branch[which(abs(d.large$perror.date1) > 100)]
colnames(bige1) <- c("node", "tree", "date", "branch")

bige2 <- as.data.frame(d.large$node[which(abs(d.large$perror.date2) > 100)])
bige2$tree <- d.large$tree[which(abs(d.large$perror.date2) > 100)]
bige2$date <- "date2"
bige2$branch <- d.large$branch[which(abs(d.large$perror.date2) > 100)]
colnames(bige2) <- c("node", "tree", "date", "branch")

bigd <- rbind(bige1, bige2)

#small diameters with perror > 250
bige1 <- as.data.frame(d.small$node[which(abs(d.small$perror.date1) > 300)])
bige1$tree <- d.small$tree[which(abs(d.small$perror.date1) > 300)]
bige1$date <- "date1"
bige1$branch <- d.small$branch[which(abs(d.small$perror.date1) > 300)]
colnames(bige1) <- c("node", "tree", "date", "branch")

bige2 <- as.data.frame(d.small$node[which(abs(d.small$perror.date2) > 300)])
bige2$tree <- d.small$tree[which(abs(d.small$perror.date2) > 300)]
bige2$date <- "date2"
bige2$branch <- d.small$branch[which(abs(d.small$perror.date2) > 300)]
colnames(bige2) <- c("node", "tree", "date", "branch")

bigd <- rbind(bigd, bige1)
bigd <- rbind(bigd, bige2)


#### Now length
bige1 <- as.data.frame(lb$node[which(abs(lb$perror.date1) > 100)])
bige1$tree <- lb$tree[which(abs(lb$perror.date1) > 100)]
bige1$date <- "date1"
bige1$branch <- lb$branch[which(abs(lb$perror.date1) > 100)]
colnames(bige1) <- c("node", "tree", "date", "branch")

bige2 <- as.data.frame(lb$node[which(abs(lb$perror.date2) > 100)])
bige2$tree <- lb$tree[which(abs(lb$perror.date2) > 100)]
bige2$date <- "date2"
bige2$branch <- lb$branch[which(abs(lb$perror.date2) > 100)]
colnames(bige2) <- c("node", "tree", "date", "branch")

bigl <- rbind(bige1, bige2)

write.csv(bigd, "../OUT/large.errors.diam.csv")
write.csv(bigl, "../OUT/large.errors.len.csv")
