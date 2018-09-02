# measurement count

names <- "start"

count <- as.data.frame(names)
count$V2 <- NA
count$V3 <- NA
count$V4 <- NA
count$V5 <- NA

tree <- c("memorialoak", "elm", "walnut2")
i <- 1

for (i in 1:length(tree)) {
names <- c("1", "2", "3")
t <- as.data.frame(names)
d1 <- length(comb.all.data$measurement[which(comb.all.data$measurement == "diameter" &
                                         is.na(comb.all.data$value.date1) == FALSE &
                                           comb.all.data$tree == tree[i])])
d2 <- length(comb.all.data$measurement[which(comb.all.data$measurement == "diameter" &
                                         is.na(comb.all.data$value.date2) == FALSE &
                                           comb.all.data$tree == tree[i])])
dr <- length(comb.all.data$measurement[which(comb.all.data$measurement == "diameter" &
                                               is.na(comb.all.data$value.real) == FALSE &
                                               comb.all.data$broken.real != "b" &
                                               comb.all.data$broken.real != "bm" &
                                               comb.all.data$tree == tree[i])])

l1 <- length(comb.all.data$measurement[which(comb.all.data$measurement == "length" &
                                               is.na(comb.all.data$value.date1) == FALSE &
                                               comb.all.data$tree == tree[i])])
l2 <- length(comb.all.data$measurement[which(comb.all.data$measurement == "length" &
                                               is.na(comb.all.data$value.date2) == FALSE &
                                               comb.all.data$tree == tree[i])])
lr <- length(comb.all.data$measurement[which(comb.all.data$measurement == "length" &
                                               is.na(comb.all.data$value.real) == FALSE &
                                               comb.all.data$broken.real != "b" &
                                               comb.all.data$broken.real != "bm" &
                                               comb.all.data$tree == tree[i])])

lb1 <- length(comb.all.data$measurement[which(comb.all.data$measurement == "length" &
                                               is.na(comb.all.data$value.date1) == FALSE &
                                               comb.all.data$tree == tree[i] &
                                               comb.all.data$endpoint == "branch")])
lb2 <- length(comb.all.data$measurement[which(comb.all.data$measurement == "length" &
                                               is.na(comb.all.data$value.date2) == FALSE &
                                               comb.all.data$tree == tree[i] &
                                               comb.all.data$endpoint == "branch")])
lbr <- length(comb.all.data$measurement[which(comb.all.data$measurement == "length" &
                                               is.na(comb.all.data$value.real) == FALSE &
                                               comb.all.data$broken.real != "b" &
                                               comb.all.data$broken.real != "bm" &
                                               comb.all.data$tree == tree[i] &
                                               comb.all.data$endpoint == "branch")])

le1 <- length(comb.all.data$measurement[which(comb.all.data$measurement == "length" &
                                                is.na(comb.all.data$value.date1) == FALSE &
                                                comb.all.data$tree == tree[i] &
                                                comb.all.data$endpoint == "end")])
le2 <- length(comb.all.data$measurement[which(comb.all.data$measurement == "length" &
                                                is.na(comb.all.data$value.date2) == FALSE &
                                                comb.all.data$tree == tree[i] &
                                                comb.all.data$endpoint == "end")])
ler <- length(comb.all.data$measurement[which(comb.all.data$measurement == "length" &
                                                is.na(comb.all.data$value.real) == FALSE &
                                                comb.all.data$broken.real != "b" &
                                                comb.all.data$broken.real != "bm" &
                                                comb.all.data$tree == tree[i] &
                                                comb.all.data$endpoint == "end")])

t[1, 2] <- dr
t[2, 2] <- d1
t[3, 2] <- d2

t[1, 3] <- lr
t[2, 3] <- l1
t[3, 3] <- l2

t[1, 4] <- lbr
t[2, 4] <- lb1
t[3, 4] <- lb2

t[1, 5] <- ler
t[2, 5] <- le1
t[3, 5] <- le2

count <- rbind(count, t)

i <- i + 1
}

count <- count[-1,]

count$names <- c("Memorial Oak, real", "Memorial Oak, date 1", "Memorial Oak, date 2",
           "Elm, real",  "Elm, date 1", "Elm, date 2",
           "Walnut, real", "Walnut, date 1", "Walnut, date 1")

