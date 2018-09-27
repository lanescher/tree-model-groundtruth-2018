# t tests
ttest <- as.data.frame(c("All", "Memorial Oak", "Elm", "Walnut"))
ttest$diameter <- NA
ttest$length <- NA
ttest$lengthbranch <- NA
ttest$lengthend <- NA

ttest[1,2] <- t.test((abs(d.all.weather$error.x) ~ d.all.weather$weather))$p.value
ttest[2,2] <- t.test((abs(d.all.weather$error.x)[which(d.all.weather$tree == "memorialoak")] ~ 
         d.all.weather$weather[which(d.all.weather$tree == "memorialoak")]))$p.value
ttest[3,2] <- t.test((abs(d.all.weather$error.x)[which(d.all.weather$tree == "elm")] ~ 
         d.all.weather$weather[which(d.all.weather$tree == "elm")]))$p.value
ttest[4,2] <- t.test((abs(d.all.weather$error.x)[which(d.all.weather$tree == "walnut2")] ~ 
         d.all.weather$weather[which(d.all.weather$tree == "walnut2")]))$p.value

ttest[1,3] <- t.test((abs(l.all.weather$error.x) ~ l.all.weather$weather))$p.value
ttest[2,3] <- t.test((abs(l.all.weather$error.x)[which(l.all.weather$tree == "memorialoak")] ~ 
                       l.all.weather$weather[which(l.all.weather$tree == "memorialoak")]))$p.value
ttest[3,3] <- t.test((abs(l.all.weather$error.x)[which(l.all.weather$tree == "elm")] ~ 
                       l.all.weather$weather[which(l.all.weather$tree == "elm")]))$p.value
ttest[4,3] <- t.test((abs(l.all.weather$error.x)[which(l.all.weather$tree == "walnut2")] ~ 
                       l.all.weather$weather[which(l.all.weather$tree == "walnut2")]))$p.value

ttest[1,4] <- t.test((abs(lb.weather$error.x) ~ lb.weather$weather))$p.value
ttest[2,4] <- t.test((abs(lb.weather$error.x)[which(lb.weather$tree == "memorialoak")] ~ 
                       lb.weather$weather[which(lb.weather$tree == "memorialoak")]))$p.value
ttest[3,4] <- t.test((abs(lb.weather$error.x)[which(lb.weather$tree == "elm")] ~ 
                       lb.weather$weather[which(lb.weather$tree == "elm")]))$p.value
ttest[4,4] <- t.test((abs(lb.weather$error.x)[which(lb.weather$tree == "walnut2")] ~ 
                       lb.weather$weather[which(lb.weather$tree == "walnut2")]))$p.value


ttest[1,5] <- t.test((abs(le.weather$error.x) ~ le.weather$weather))$p.value
ttest[2,5] <- t.test((abs(le.weather$error.x)[which(le.weather$tree == "memorialoak")] ~ 
                       le.weather$weather[which(le.weather$tree == "memorialoak")]))$p.value
ttest[3,5] <- t.test((abs(le.weather$error.x)[which(le.weather$tree == "elm")] ~ 
                       le.weather$weather[which(le.weather$tree == "elm")]))$p.value
ttest[4,5] <- t.test((abs(le.weather$error.x)[which(le.weather$tree == "walnut2")] ~ 
                       le.weather$weather[which(le.weather$tree == "walnut2")]))$p.value

names(ttest) <- c("", "Diameter", "Length", "Length, to branch", "Length, to end")
write.csv(ttest, "../OUT/TABLE.light.conditions.pvalues.absvalueerror.csv")




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
  labs(x = "", y = "error of diameters (cm)") +
  theme(legend.position = "none", 
        panel.background = element_rect(fill = "white", colour = "grey50")) +
  geom_hline(yintercept = 0, color = "grey60") +
  stat_compare_means(aes(label = ..p.signif..),
                     method = "t.test",
                     symnum.args = list(cutpoints = c(0, 0.0001, 0.001, 0.01, 0.05, 1), 
                                        symbols = c("****", "***", "**", "*", "")))



l <- ggplot(data = l.all.weather, aes(x = tree, y = abs(error.x), 
                                 fill = interaction(tree, weather))) +
  geom_boxplot() +
  scale_fill_manual(values = c(darken("brown4", 1.1), darken("cornflowerblue"), 
                               darken("goldenrod2"), 
                               lighten("brown4"), lighten("cornflowerblue"),
                               lighten("goldenrod2")))  +
  labs(x = "", y = "error of lengths (cm)") +
  theme(legend.position = "none", 
        panel.background = element_rect(fill = "white", colour = "grey50")) +
  geom_hline(yintercept = 0, color = "grey60") +
  stat_compare_means(aes(label = ..p.signif..),
                     method = "t.test")



lb <- ggplot(data = lb.weather, aes(x = tree, y = abs(error.x),
                              fill = interaction(tree, weather))) +
  geom_boxplot() +
  scale_fill_manual(values = c(darken("brown4", 1.1), darken("cornflowerblue"), 
                               darken("goldenrod2"), 
                               lighten("brown4"), lighten("cornflowerblue"),
                               lighten("goldenrod2")))  +
  labs(x = "", y = "error of lengths, node to node (cm)") +
  theme(legend.position = "none", 
        panel.background = element_rect(fill = "white", colour = "grey50")) +
  geom_hline(yintercept = 0, color = "grey60") +
  stat_compare_means(aes(label = ..p.signif..),
                     method = "t.test")



le <- ggplot(data = le.weather, aes(x = tree, y = abs(error.x),
                              fill = interaction(tree, weather))) +
  geom_boxplot() +
  scale_fill_manual(values = c(darken("brown4", 1.1), darken("cornflowerblue"), 
                               darken("goldenrod2"), 
                               lighten("brown4"), lighten("cornflowerblue"),
                               lighten("goldenrod2")))  +
  labs(x = "", y = "error of lengths, node to end (cm)") +
  theme(legend.position = "none", 
        panel.background = element_rect(fill = "white", colour = "grey50")) +
  geom_hline(yintercept = 0, color = "grey60") +
  stat_compare_means(aes(label = ..p.signif..),
                     method = "t.test",
                     symnum.args = list(cutpoints = c(0, 0.0001, 0.001, 0.01, 0.05, 1), 
                                        symbols = c("****", "***", "**", "*", "")))


figure <- ggarrange(d, lb, le, labels = c("A", "B", "C"),
          ncol = 1, nrow = 3,
          align = "hv")
ggsave(plot = figure, "../OUT/FIGURE.lightconditions.error.jpg",
       width = 4, height = 10)
