# subset comb.all.data

d.all.data <- comb.all.data[which(comb.all.data$measurement == "diameter"),]
l.all.data <- comb.all.data[which(comb.all.data$measurement == "length"),]
le <- l.all.data[which(l.all.data$endpoint == "end"),]
lb <- l.all.data[which(l.all.data$endpoint == "branch"),]
