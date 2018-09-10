# plots for presentation

all.data$tree <- "walnut2"
all.measure.comb <- all.data
all.data$tree <- "memorialoak"
all.measure.comb <- rbind(all.measure.comb, all.data)
all.data$tree <- "elm"
all.measure.comb <- rbind(all.measure.comb, all.data)

# model consistency
# diameter
use.data1 <- subset(all.measure.comb, 
                   all.measure.comb$measurement == "diameter" & 
                     all.measure.comb$broken.real != "b" &
                     all.measure.comb$broken.real != "bm")

dc <- ggplot(data = use.data1,
       aes(x = use.data1$value.date1, 
           y = use.data1$value.date2)) +
  geom_point(aes(color = use.data1$tree)) +
  theme_classic() +
  scale_colour_manual(values = c("cornflowerblue", "goldenrod2", "#B4464B"),
                      name = "Tree") +
  labs(title = "Diameter consistency",
       x = "model 1 diameter (cm)", y = "model 2 diameter (cm)") +
  lims(x = c(0, 45), y = c(0, 45)) +
  geom_smooth(method = "lm", aes(color = use.data1$tree)) +
  geom_abline(col = "red") +
  geom_text(x = 10, y = 40, 
            label = paste("r2=", format(summary(lm(use.data1$value.date2[which(use.data1$tree == "walnut2")] ~ 
                                                     use.data1$value.date1[which(use.data1$tree == "walnut2")]))$r.squared, 
                                        digits = 2)),
            color = "#B4464B") +
  geom_text(x = 10, y = 42, 
            label = paste("r2=", format(summary(lm(use.data1$value.date2[which(use.data1$tree == "memorialoak")] ~ 
                                                     use.data1$value.date1[which(use.data1$tree == "memorialoak")]))$r.squared, 
                                        digits = 2)),
            color = "goldenrod2") +
  geom_text(x = 10, y = 44, 
            label = paste("r2=", format(summary(lm(use.data1$value.date2[which(use.data1$tree == "elm")] ~ 
                                                     use.data1$value.date1[which(use.data1$tree == "elm")]))$r.squared, 
                                        digits = 2)),
            color = "cornflowerblue")
  
# length
use.data2 <- subset(all.measure.comb, 
                     all.measure.comb$measurement == "length" & 
                     all.measure.comb$endpoint == "branch" & 
                     all.measure.comb$broken.real != "b" &
                     all.measure.comb$broken.real != "bm")

lc <- ggplot(data = use.data2,
       aes(x = use.data2$value.date1, 
           y = use.data2$value.date2)) +
  geom_point(aes(color = use.data2$tree)) +
  theme_classic() +
  scale_colour_manual(values = c("cornflowerblue", "goldenrod2", "#B4464B"),
                      name = "Tree") +
  labs(title = "Length consistency",
       x = "model 1 length (cm)", y = "model 2 length (cm)") +
  lims(x = c(0, 230), y = c(0, 230)) +
  geom_smooth(method = "lm", aes(color = use.data2$tree)) +
  geom_abline(col = "red") +
  geom_text(x = 50, y = 200, 
            label = paste("r2=", format(summary(lm(use.data2$value.date2[which(use.data2$tree == "walnut2")] ~ 
                                                     use.data2$value.date1[which(use.data2$tree == "walnut2")]))$r.squared, 
                                        digits = 2)),
            color = "#B4464B") +
  geom_text(x = 50, y = 210, 
            label = paste("r2=", format(summary(lm(use.data2$value.date2[which(use.data2$tree == "memorialoak")] ~ 
                                                     use.data2$value.date1[which(use.data2$tree == "memorialoak")]))$r.squared, 
                                        digits = 2)),
            color = "goldenrod2") +
  geom_text(x = 50, y = 220, 
            label = paste("r2=", format(summary(lm(use.data2$value.date2[which(use.data2$tree == "elm")] ~ 
                                                     use.data2$value.date1[which(use.data2$tree == "elm")]))$r.squared, 
                                        digits = 2)),
            color = "cornflowerblue")


ggarrange(dc, lc, labels = c("A", "B"),
          common.legend = TRUE, legend = "bottom")


# model accuracy
# diameter
use.data3 <- use.data1[which(use.data1$node != "6.2.1"),]

da <- ggplot(data = use.data3,
       aes(x = use.data3$value.real, 
           y = use.data3$value.avg)) +
  geom_point(aes(color = use.data3$tree)) +
  theme_classic() +
  scale_colour_manual(values = c("cornflowerblue", "goldenrod2", "#B4464B"),
                      name = "Tree") +
  labs(title = "Diameter accuracy",
       x = "real diameter (cm)", y = "average model diameter (cm)") +
  geom_smooth(method = "lm", aes(color = use.data3$tree)) +
  geom_abline(col = "red") +
  geom_text(x = 5, y = 38, 
            label = paste("r2=", format(summary(lm(use.data3$value.avg[which(use.data3$tree == "walnut2")] ~ 
                                                     use.data3$value.real[which(use.data3$tree == "walnut2")]))$r.squared, 
                                        digits = 2)),
            color = "#B4464B") +
  geom_text(x = 5, y = 40, 
            label = paste("r2=", format(summary(lm(use.data3$value.avg[which(use.data3$tree == "memorialoak")] ~ 
                                                     use.data3$value.real[which(use.data3$tree == "memorialoak")]))$r.squared, 
                                        digits = 2)),
            color = "goldenrod2") +
  geom_text(x = 5, y = 42, 
            label = paste("r2=", format(summary(lm(use.data3$value.avg[which(use.data3$tree == "elm")] ~ 
                                                     use.data3$value.real[which(use.data3$tree == "elm")]))$r.squared, 
                                        digits = 2)),
            color = "cornflowerblue")


# length
la <- ggplot(data = use.data2,
       aes(x = use.data2$value.real, 
           y = use.data2$value.avg)) +
  geom_point(aes(color = use.data2$tree)) +
  theme_classic() +
  scale_colour_manual(values = c("cornflowerblue", "goldenrod2", "#B4464B"),
                      name = "Tree") +
  labs(title = "Length accuracy",
       x = "real length (cm)", y = "average model length (cm)") +
  geom_smooth(method = "lm", aes(color = use.data2$tree)) +
  geom_abline(col = "red") +
  geom_text(x = 25, y = 198, 
            label = paste("r2=", format(summary(lm(use.data2$value.avg[which(use.data2$tree == "walnut2")] ~ 
                                                     use.data2$value.real[which(use.data2$tree == "walnut2")]))$r.squared, 
                                        digits = 2)),
            color = "#B4464B") +
  geom_text(x = 25, y = 210, 
            label = paste("r2=", format(summary(lm(use.data2$value.avg[which(use.data2$tree == "memorialoak")] ~ 
                                                     use.data2$value.real[which(use.data2$tree == "memorialoak")]))$r.squared, 
                                        digits = 2)),
            color = "goldenrod2") +
  geom_text(x = 25, y = 222, 
            label = paste("r2=", format(summary(lm(use.data2$value.avg[which(use.data2$tree == "elm")] ~ 
                                                     use.data2$value.real[which(use.data2$tree == "elm")]))$r.squared, 
                                        digits = 2)),
            color = "cornflowerblue")


ggarrange(da, la, labels = c("A", "B"),
          common.legend = TRUE, legend = "bottom")



# percent error vs size
# diameter
ds <- ggplot(data = use.data3,
             aes(x = use.data3$value.real, 
                 y = use.data3$perror.avg)) +
  geom_point(aes(color = use.data3$tree)) +
  theme_classic() +
  scale_colour_manual(values = c("cornflowerblue", "goldenrod2", "#B4464B"),
                      name = "Tree") +
  labs(title = "Diameter accuracy",
       x = "real diameter (cm)", y = "average model diameter percent error")

ds1 <- ggplot(data = use.data3,
       aes(x = use.data3$value.real, 
           y = use.data3$perror.avg)) +
  geom_point(aes(color = use.data3$tree)) +
  theme_classic() +
  scale_colour_manual(values = c("cornflowerblue", "goldenrod2", "#B4464B"),
                      name = "Tree") +
  labs(title = "Diameter accuracy",
       x = "real diameter (cm)", y = "average model diameter percent error") +
  geom_vline(xintercept = 12.8, color = "goldenrod2") +
  geom_vline(xintercept = 8, color = "#B4464B") +
  geom_vline(xintercept = 8.8, color = "cornflowerblue")

# error > 10 cm
mean(use.data3$perror.avg[which(use.data3$value.real > 10 
                                & use.data3$ tree == "memorialoak")], 
     na.rm = TRUE)
mean(use.data3$perror.avg[which(use.data3$value.real > 10 
                                & use.data3$ tree == "walnut2")], 
     na.rm = TRUE)

# error < 10%
mean(use.data3$perror.avg[which(use.data3$value.real > 12.8 
                                & use.data3$ tree == "memorialoak")], 
     na.rm = TRUE)
mean(use.data3$perror.avg[which(use.data3$value.real > 8 
                                & use.data3$ tree == "walnut2")], 
     na.rm = TRUE)
mean(use.data3$perror.avg[which(use.data3$value.real > 8.8 
                                & use.data3$ tree == "elm")], 
     na.rm = TRUE)

# error < 20%
mean(use.data3$perror.avg[which(use.data3$value.real > 5.5 
                                & use.data3$ tree == "memorialoak")], 
     na.rm = TRUE)
mean(use.data3$perror.avg[which(use.data3$value.real > 3.5 
                                & use.data3$ tree == "walnut2")], 
     na.rm = TRUE)

# length
ls <- ggplot(data = use.data2,
       aes(x = use.data2$value.real, 
           y = use.data2$perror.avg)) +
  geom_point(aes(color = use.data2$tree)) +
  theme_classic() +
  scale_colour_manual(values = c("cornflowerblue", "goldenrod2", "#B4464B"),
                      name = "Tree") +
  labs(title = "Length accuracy",
       x = "real length (cm)", y = "average model length percent error")



ggarrange(ds, ls, labels = c("A", "B"),
          common.legend = TRUE, legend = "bottom")

ggarrange(ds1, ls, labels = c("A", "B"),
          common.legend = TRUE, legend = "bottom")


# model completeness
use.data4 <- all.measure.comb[which(all.measure.comb$measurement == "length" & 
                                      all.measure.comb$endpoint == "end" &
                                      all.measure.comb$broken.real != "b" &
                                      all.measure.comb$broken.real != "bm"),]

use.data4 <- use.data4[,c(1:5,12:14,23)]
use.data4 <- melt(use.data4, id = c("node", "branch", "measurement", "endpoint",
                                    "is.in", "value.real" , "tree"))

use.data4$perror <- (use.data4$value.real - use.data4$value) / use.data4$value.real
use.data4$perror <- use.data4$perror * 100

ggplot(data = use.data4,
       aes(x = use.data4$tree, 
           y = use.data4$perror,
           fill = use.data4$variable)) +
  geom_boxplot(aes(color = use.data4$tree)) +
  theme_classic() +
  scale_colour_manual(values = c("cornflowerblue", "goldenrod2", "#B4464B"),
                      name = "Tree") +
  labs(title = "Branch length completeness",
       x = "tree", y = "percent error branch ends (log)")

ggplot(data=all.measure.comb, 
       aes(x = all.measure.comb$tree,
           y = all.measure.comb$perror.avg)) +
  geom_boxplot()

