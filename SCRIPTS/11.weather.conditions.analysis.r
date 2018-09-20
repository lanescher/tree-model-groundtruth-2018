
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


ggplot(data = d.all.weather, aes(x = tree, y = abs(error.x), 
                                 fill = interaction(tree, weather))) +
  geom_boxplot() +
  scale_fill_manual(values = c(darken("brown4", 1.1), darken("cornflowerblue"), 
                               darken("goldenrod2"), 
                               lighten("brown4"), lighten("cornflowerblue"),
                               lighten("goldenrod2"))) +
  labs(x = "", y = "absolute error of diameters") +
  theme(legend.position = "none")



ggplot(data = l.all.weather, aes(x = tree, y = abs(error.x), 
                                 fill = interaction(tree, weather))) +
  geom_boxplot() +
  scale_fill_manual(values = c(darken("brown4", 1.1), darken("cornflowerblue"), 
                               darken("goldenrod2"), 
                               lighten("brown4"), lighten("cornflowerblue"),
                               lighten("goldenrod2")))  +
  labs(x = "", y = "absolute error of lengths") +
  theme(legend.position = "none")




ggplot(data = lb.weather, aes(x = tree, y = abs(error.x),
                              fill = interaction(tree, weather))) +
  geom_boxplot() +
  scale_fill_manual(values = c(darken("brown4", 1.1), darken("cornflowerblue"), 
                               darken("goldenrod2"), 
                               lighten("brown4"), lighten("cornflowerblue"),
                               lighten("goldenrod2")))  +
  labs(x = "", y = "absolute error of lengths, to branch") +
  theme(legend.position = "none")



ggplot(data = le.weather, aes(x = tree, y = abs(error.x),
                              fill = interaction(tree, weather))) +
  geom_boxplot() +
  scale_fill_manual(values = c(darken("brown4", 1.1), darken("cornflowerblue"), 
                               darken("goldenrod2"), 
                               lighten("brown4"), lighten("cornflowerblue"),
                               lighten("goldenrod2")))  +
  labs(x = "", y = "absolute error of lengths, to end") +
  theme(legend.position = "none")
