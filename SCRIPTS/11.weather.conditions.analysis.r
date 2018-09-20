
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


d <- ggplot(d.all.weather, aes(x = tree, y = abs(error.x), fill = interaction(weather, sizeclass, tree))) +
  geom_boxplot() +
  theme(legend.position = "none")

lb <- ggplot(lb.weather, aes(x = tree, y = abs(error.x), fill = interaction(weather, sizeclass, tree))) +
  geom_boxplot() +
  theme(legend.position = "none")

le <- ggplot(le.weather, aes(x = tree, y = abs(error.x), fill = interaction(weather, sizeclass, tree))) +
  geom_boxplot() +
  theme(legend.position = "none")

jpeg("../OUT/FIGURE.lightconditions.error.size.jpg", width = 400, height = 1000)
ggarrange(d, lb, le, labels = c("A", "B", "C"),
          ncol = 1, nrow = 3,
          align = "hv")
dev.off()


darken <- function(color, factor=1.25){
  col <- col2rgb(color)
  col <- col/factor
  col <- rgb(t(col), maxColorValue=255)
  col
}

lighten <- function(color, factor=1.25){
  col <- col2rgb(color)
  col <- col*factor
  col <- rgb(t(as.matrix(apply(col, 1, function(x) if (x > 255) 255 else x))), maxColorValue=255)
  col
}


d <- ggplot(data = d.all.weather, aes(x = tree, y = abs(error.x), 
                                 fill = interaction(tree, weather))) +
  geom_boxplot() +
  scale_fill_manual(values = c(darken("brown4", 1.1), darken("cornflowerblue"), 
                               darken("goldenrod2"), 
                               lighten("brown4"), lighten("cornflowerblue"),
                               lighten("goldenrod2"))) +
  labs(x = "", y = "absolute error of diameters") +
  theme(legend.position = "none", 
        panel.background = element_rect(fill = "white", colour = "grey50")) +
  geom_hline(yintercept = 0, color = "grey60")



ggplot(data = l.all.weather, aes(x = tree, y = abs(error.x), 
                                 fill = interaction(tree, weather))) +
  geom_boxplot() +
  scale_fill_manual(values = c(darken("brown4", 1.1), darken("cornflowerblue"), 
                               darken("goldenrod2"), 
                               lighten("brown4"), lighten("cornflowerblue"),
                               lighten("goldenrod2")))  +
  labs(x = "", y = "absolute error of lengths") +
  theme(legend.position = "none", 
        panel.background = element_rect(fill = "white", colour = "grey50")) +
  geom_hline(yintercept = 0, color = "grey60")




lb <- ggplot(data = lb.weather, aes(x = tree, y = abs(error.x),
                              fill = interaction(tree, weather))) +
  geom_boxplot() +
  scale_fill_manual(values = c(darken("brown4", 1.1), darken("cornflowerblue"), 
                               darken("goldenrod2"), 
                               lighten("brown4"), lighten("cornflowerblue"),
                               lighten("goldenrod2")))  +
  labs(x = "", y = "absolute error of lengths, to branch") +
  theme(legend.position = "none", 
        panel.background = element_rect(fill = "white", colour = "grey50")) +
  geom_hline(yintercept = 0, color = "grey60")



le <- ggplot(data = le.weather, aes(x = tree, y = abs(error.x),
                              fill = interaction(tree, weather))) +
  geom_boxplot() +
  scale_fill_manual(values = c(darken("brown4", 1.1), darken("cornflowerblue"), 
                               darken("goldenrod2"), 
                               lighten("brown4"), lighten("cornflowerblue"),
                               lighten("goldenrod2")))  +
  labs(x = "", y = "absolute error of lengths, to end") +
  theme(legend.position = "none", 
        panel.background = element_rect(fill = "white", colour = "grey50")) +
  geom_hline(yintercept = 0, color = "grey60")


jpeg("../OUT/FIGURE.lightconditions.error.jpg", width = 400, height = 1000)
ggarrange(d, lb, le, labels = c("A", "B", "C"),
          ncol = 1, nrow = 3,
          align = "hv")
dev.off()
