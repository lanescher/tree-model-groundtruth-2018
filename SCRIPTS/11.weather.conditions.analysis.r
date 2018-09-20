
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
