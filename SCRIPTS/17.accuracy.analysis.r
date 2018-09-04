

# diameter

d1 <- ggplot(data = d.all.data,
       aes(x = d.all.data$value.date1, y = d.all.data$value.real,
           color = factor(d.all.data$tree))) +
  geom_point() +
  geom_abline(intercept = 0, slope = 1) +
  geom_smooth(method = "lm", aes(color = factor(d.all.data$tree))) +
  xlim(0,45) + ylim(0,45)


d2 <- ggplot(data = d.all.data,
       aes(x = d.all.data$value.date2, y = d.all.data$value.real,
           color = factor(d.all.data$tree))) +
  geom_point() +
  geom_abline(intercept = 0, slope = 1) +
  geom_smooth(method = "lm", aes(color = factor(d.all.data$tree))) +
  xlim(0,45) + ylim(0,45)

davg <- ggplot(data = d.all.data,
       aes(x = d.all.data$value.avg, y = d.all.data$value.real,
           color = factor(d.all.data$tree))) +
  geom_point() +
  geom_abline(intercept = 0, slope = 1) +
  geom_smooth(method = "lm", aes(color = factor(d.all.data$tree))) +
  xlim(0,45) + ylim(0,45)

jpeg("../OUT/FIGURE.DiameterAccuracy.jpg", width = 1800, height = 600)
ggarrange(d1, d2, davg, 
          labels = c("A", "B", "C"),
          ncol = 3, nrow = 1,
          common.legend = TRUE,
          align = "hv")
dev.off()



# length

l1 <- ggplot(data = l.all.data,
             aes(x = l.all.data$value.date1, y = l.all.data$value.real,
                 color = factor(l.all.data$tree))) +
  geom_point() +
  geom_abline(intercept = 0, slope = 1) +
  geom_smooth(method = "lm", aes(color = factor(l.all.data$tree))) +
  xlim(0,300) + ylim(0,300)


l2 <- ggplot(data = l.all.data,
             aes(x = l.all.data$value.date2, y = l.all.data$value.real,
                 color = factor(l.all.data$tree))) +
  geom_point() +
  geom_abline(intercept = 0, slope = 1) +
  geom_smooth(method = "lm", aes(color = factor(l.all.data$tree))) +
  xlim(0,300) + ylim(0,300)

lavg <- ggplot(data = l.all.data,
               aes(x = l.all.data$value.avg, y = l.all.data$value.real,
                   color = factor(l.all.data$tree))) +
  geom_point() +
  geom_abline(intercept = 0, slope = 1) +
  geom_smooth(method = "lm", aes(color = factor(l.all.data$tree))) +
  xlim(0,300) + ylim(0,300)

jpeg("../OUT/FIGURE.LengthAccuracy.jpg", width = 1800, height = 600)
ggarrange(l1, l2, lavg, 
          labels = c("A", "B", "C"),
          ncol = 3, nrow = 1,
          common.legend = TRUE,
          align = "hv")
dev.off()



# length, to branch

lb1 <- ggplot(data = lb,
             aes(x = lb$value.date1, y = lb$value.real,
                 color = factor(lb$tree))) +
  geom_point() +
  geom_abline(intercept = 0, slope = 1) +
  geom_smooth(method = "lm", aes(color = factor(lb$tree))) +
  xlim(0,200) + ylim(0,200)


lb2 <- ggplot(data = lb,
             aes(x = lb$value.date2, y = lb$value.real,
                 color = factor(lb$tree))) +
  geom_point() +
  geom_abline(intercept = 0, slope = 1) +
  geom_smooth(method = "lm", aes(color = factor(lb$tree))) +
  xlim(0,200) + ylim(0,200)

lbavg <- ggplot(data = lb,
               aes(x = lb$value.avg, y = lb$value.real,
                   color = factor(lb$tree))) +
  geom_point() +
  geom_abline(intercept = 0, slope = 1) +
  geom_smooth(method = "lm", aes(color = factor(lb$tree))) +
  xlim(0,200) + ylim(0,200)

jpeg("../OUT/FIGURE.LengthBranchAccuracy.jpg", width = 1800, height = 600)
ggarrange(lb1, lb2, lbavg, 
          labels = c("A", "B", "C"),
          ncol = 3, nrow = 1,
          common.legend = TRUE,
          align = "hv")
dev.off()



# length, to end

le1 <- ggplot(data = le,
              aes(x = le$value.date1, y = le$value.real,
                  color = factor(le$tree))) +
  geom_point() +
  geom_abline(intercept = 0, slope = 1) +
  geom_smooth(method = "lm", aes(color = factor(le$tree))) +
  xlim(0,301) + ylim(0,301)


le2 <- ggplot(data = le,
              aes(x = le$value.date2, y = le$value.real,
                  color = factor(le$tree))) +
  geom_point() +
  geom_abline(intercept = 0, slope = 1) +
  geom_smooth(method = "lm", aes(color = factor(le$tree))) +
  xlim(0,301) + ylim(0,301)

leavg <- ggplot(data = le,
                aes(x = le$value.avg, y = le$value.real,
                    color = factor(le$tree))) +
  geom_point() +
  geom_abline(intercept = 0, slope = 1) +
  geom_smooth(method = "lm", aes(color = factor(le$tree))) +
  xlim(0,301) + ylim(0,301)

jpeg("../OUT/FIGURE.LengthEndAccuracy.jpg", width = 1800, height = 600)
ggarrange(le1, le2, leavg, 
          labels = c("A", "B", "C"),
          ncol = 3, nrow = 1,
          common.legend = TRUE,
          align = "hv")
dev.off()



## diameter accuracy by size

ds1 <- ggplot(data = d.all.data,
             aes(x = d.all.data$value.date1, y = d.all.data$perror,
                 color = factor(d.all.data$tree))) +
  geom_point()


ds2 <- ggplot(data = d.all.data,
             aes(x = d.all.data$value.date2, y = d.all.data$perror,
                 color = factor(d.all.data$tree))) +
  geom_point()

dsavg <- ggplot(data = d.all.data,
               aes(x = d.all.data$value.avg, y = d.all.data$perror,
                   color = factor(d.all.data$tree))) +
  geom_point()

jpeg("../OUT/FIGURE.DiameterAccuracySize.jpg", width = 1800, height = 600)
ggarrange(ds1, ds2, dsavg, 
          labels = c("A", "B", "C"),
          ncol = 3, nrow = 1,
          common.legend = TRUE,
          align = "hv")
dev.off()


## length accuracy by size

ls1 <- ggplot(data = l.all.data,
              aes(x = l.all.data$value.date1, y = l.all.data$perror,
                  color = factor(l.all.data$tree))) +
  geom_point() +
  ylim(-100,250)


ls2 <- ggplot(data = l.all.data,
              aes(x = l.all.data$value.date2, y = l.all.data$perror,
                  color = factor(l.all.data$tree))) +
  geom_point() +
  ylim(-100,250)

lsavg <- ggplot(data = l.all.data,
                aes(x = l.all.data$value.avg, y = l.all.data$perror,
                    color = factor(l.all.data$tree))) +
  geom_point() +
  ylim(-100,250)

jpeg("../OUT/FIGURE.LengthAccuracySizeZoom.jpg", width = 1800, height = 600)
ggarrange(ls1, ls2, lsavg, 
          labels = c("A", "B", "C"),
          ncol = 3, nrow = 1,
          common.legend = TRUE,
          align = "hv")
dev.off()



## length, to branch, accuracy by size

lbs1 <- ggplot(data = lb,
              aes(x = lb$value.date1, y = lb$perror,
                  color = factor(lb$tree))) +
  geom_point()


lbs2 <- ggplot(data = lb,
              aes(x = lb$value.date2, y = lb$perror,
                  color = factor(lb$tree))) +
  geom_point()

lbsavg <- ggplot(data = lb,
                aes(x = lb$value.avg, y = lb$perror,
                    color = factor(lb$tree))) +
  geom_point()

jpeg("../OUT/FIGURE.LengthBranchAccuracySize.jpg", width = 1800, height = 600)
ggarrange(lbs1, lbs2, lbsavg, 
          labels = c("A", "B", "C"),
          ncol = 3, nrow = 1,
          common.legend = TRUE,
          align = "hv")
dev.off()
