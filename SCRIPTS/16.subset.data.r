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



