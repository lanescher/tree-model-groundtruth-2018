# add size class column
d.all.weather$sizeclass <- NA
d.all.weather$sizeclass[which(d.all.weather$value.real < 5)] <- "<5"
d.all.weather$sizeclass[which(d.all.weather$value.real >= 5 & 
                                d.all.weather$value.real < 10)] <- "5 - 10"
d.all.weather$sizeclass[which(d.all.weather$value.real >= 10 & 
                                d.all.weather$value.real < 20)] <- "10 - 20"
d.all.weather$sizeclass[which(d.all.weather$value.real >= 20 & 
                                d.all.weather$value.real < 30)] <- "20 - 30"
d.all.weather$sizeclass[which(d.all.weather$value.real >= 30)] <- ">30"
d.all.weather$sizeclass <- factor(d.all.weather$sizeclass, levels = c("<5", "5 - 10", "10 - 20", "20 - 30", ">30"))



l.all.weather$sizeclass <- NA
l.all.weather$sizeclass[which(l.all.weather$value.real < 5)] <- "<5"
l.all.weather$sizeclass[which(l.all.weather$value.real >= 5 & 
                                l.all.weather$value.real < 10)] <- "5 - 10"
l.all.weather$sizeclass[which(l.all.weather$value.real >= 10 & 
                                l.all.weather$value.real < 20)] <- "10 - 20"
l.all.weather$sizeclass[which(l.all.weather$value.real >= 20 & 
                                l.all.weather$value.real < 30)] <- "20 - 30"
l.all.weather$sizeclass[which(l.all.weather$value.real >= 30)] <- ">30"
l.all.weather$sizeclass <- factor(l.all.weather$sizeclass, levels = c("<5", "5 - 10", "10 - 20", "20 - 30", ">30"))

le.weather$sizeclass <- NA
le.weather$sizeclass[which(le.weather$value.real < 5)] <- "<5"
le.weather$sizeclass[which(le.weather$value.real >= 5 & 
                             le.weather$value.real < 10)] <- "5 - 10"
le.weather$sizeclass[which(le.weather$value.real >= 10 & 
                             le.weather$value.real < 20)] <- "10 - 20"
le.weather$sizeclass[which(le.weather$value.real >= 20 & 
                             le.weather$value.real < 30)] <- "20 - 30"
le.weather$sizeclass[which(le.weather$value.real >= 30)] <- ">30"
le.weather$sizeclass <- factor(le.weather$sizeclass, levels = c("<5", "5 - 10", "10 - 20", "20 - 30", ">30"))


lb.weather$sizeclass <- NA
lb.weather$sizeclass[which(lb.weather$value.real < 5)] <- "<5"
lb.weather$sizeclass[which(lb.weather$value.real >= 5 & 
                             lb.weather$value.real < 10)] <- "5 - 10"
lb.weather$sizeclass[which(lb.weather$value.real >= 10 & 
                             lb.weather$value.real < 20)] <- "10 - 20"
lb.weather$sizeclass[which(lb.weather$value.real >= 20 & 
                             lb.weather$value.real < 30)] <- "20 - 30"
lb.weather$sizeclass[which(lb.weather$value.real >= 30)] <- ">30"
lb.weather$sizeclass <- factor(lb.weather$sizeclass, levels = c("<5", "5 - 10", "10 - 20", "20 - 30", ">30"))


d <- ggplot(d.all.weather, aes(x = tree, y = error.x, fill = interaction(weather, sizeclass, tree))) +
  geom_boxplot() +
  theme(legend.position = "none")

lb <- ggplot(lb.weather, aes(x = tree, y = error.x, fill = interaction(weather, sizeclass, tree))) +
  geom_boxplot() +
  theme(legend.position = "none")

le <- ggplot(le.weather, aes(x = tree, y = error.x, fill = interaction(weather, sizeclass, tree))) +
  geom_boxplot() +
  theme(legend.position = "none")

jpeg("../OUT/FIGURE.lightconditions.error.size.jpg", width = 400, height = 1000)
ggarrange(d, lb, le, labels = c("A", "B", "C"),
          ncol = 1, nrow = 3,
          align = "hv")
dev.off()
