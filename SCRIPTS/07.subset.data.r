# subset comb.all.data

comb.all.data$color <- NA
comb.all.data$color[which(comb.all.data$tree == "memorialoak")] <- "cornflowerblue"
comb.all.data$color[which(comb.all.data$tree == "walnut2")] <- "goldenrod"
comb.all.data$color[which(comb.all.data$tree == "elm")] <- "brown4"

d.all.data <- comb.all.data[which(comb.all.data$measurement == "diameter"),]
l.all.data <- comb.all.data[which(comb.all.data$measurement == "length"),]
l.all.data$diam <- d.all.data$value.real
le <- l.all.data[which(l.all.data$endpoint == "end"),]
lb <- l.all.data[which(l.all.data$endpoint == "branch"),]



# split df by weather ----

da1 <- d.all.data[,-c(14, 15, 24, 25)]
da2 <- d.all.data[,-c(12, 13, 22, 23)]

names(da1)[12] <- "value"
names(da1)[13] <- "weather"
names(da1)[20] <- "error.x"
names(da1)[21] <- "perror.x"

names(da2)[12] <- "value"
names(da2)[13] <- "weather"
names(da2)[20] <- "error.x"
names(da2)[21] <- "perror.x"

d.all.weather <- rbind(da1, da2)


da1 <- l.all.data[,-c(14, 15, 24, 25)]
da2 <- l.all.data[,-c(12, 13, 22, 23)]

names(da1)[12] <- "value"
names(da1)[13] <- "weather"
names(da1)[20] <- "error.x"
names(da1)[21] <- "perror.x"

names(da2)[12] <- "value"
names(da2)[13] <- "weather"
names(da2)[20] <- "error.x"
names(da2)[21] <- "perror.x"

l.all.weather <- rbind(da1, da2)


da1 <- lb[,-c(14, 15, 24, 25)]
da2 <- lb[,-c(12, 13, 22, 23)]

names(da1)[12] <- "value"
names(da1)[13] <- "weather"
names(da1)[20] <- "error.x"
names(da1)[21] <- "perror.x"

names(da2)[12] <- "value"
names(da2)[13] <- "weather"
names(da2)[20] <- "error.x"
names(da2)[21] <- "perror.x"

lb.weather <- rbind(da1, da2)

da1 <- le[,-c(14, 15, 24, 25)]
da2 <- le[,-c(12, 13, 22, 23)]

names(da1)[12] <- "value"
names(da1)[13] <- "weather"
names(da1)[20] <- "error.x"
names(da1)[21] <- "perror.x"

names(da2)[12] <- "value"
names(da2)[13] <- "weather"
names(da2)[20] <- "error.x"
names(da2)[21] <- "perror.x"

le.weather <- rbind(da1, da2)
