

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
             aes(x = d.all.data$value.real, y = d.all.data$perror.date1,
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






jpeg("../OUT/FIGURE.DiameterLengthAccuracy.jpg", width = 1800, height = 900)
ggarrange(davg, lbavg, 
          labels = c("A", "B"),
          ncol = 2, nrow = 1,
          common.legend = TRUE,
          align = "hv")
dev.off()


jpeg("../OUT/FIGURE.DiameterLengthAccuracySize.jpg", width = 1800, height = 900)
ggarrange(dsavg, lbsavg, 
          labels = c("A", "B"),
          ncol = 2, nrow = 1,
          common.legend = TRUE,
          align = "hv")
dev.off()


ggplot(data = l.all.data,
       aes(x = l.all.data$diam, y = l.all.data$error,
           color = factor(l.all.data$tree))) +
  geom_point()


### set up for diameter error by size figure ----
mm <- as.data.frame(d.all.data$error.date1)
mm$d2 <- d.all.data$error.date2

d.all.data$min <- apply(mm, 1, FUN=min)
d.all.data$max <- apply(mm, 1, FUN=max)


ds <- ggplot() +
  geom_linerange(data=d.all.data, 
                 mapping=aes(x=d.all.data$value.real, 
                             ymin=d.all.data$min, 
                             ymax=d.all.data$max),
                 color = d.all.data$color,
                 size = 1,
                 show.legend = TRUE) +
  xlim(0,40) +
  ylim(-5, 15) + 
  geom_point(data=d.all.data, 
             mapping=aes(x=d.all.data$value.real, y=d.all.data$error.avg), 
             size=0.5, color = d.all.data$color) +
  labs(x = "branch diameter", y = "diameter absolute error (cm)") +
  geom_hline(yintercept = 0, color = "grey45") +
  theme(panel.background = element_rect(fill = "white", colour = "grey50"))
  


### set up for length error by size figure ----
mm <- as.data.frame(lb$error.date1)
mm$d2 <- lb$error.date2

lb$min <- apply(mm, 1, FUN=min)
lb$max <- apply(mm, 1, FUN=max)

ls <- ggplot() +
  geom_linerange(data=lb, 
                 mapping=aes(x=lb$diam, 
                             ymin=lb$min, 
                             ymax=lb$max),
                 color = lb$color,
                 size = 1,
                 show.legend = TRUE) +
  geom_point(data=lb, 
             mapping=aes(x=lb$diam, y=lb$error.avg), 
             size=0.5, color = lb$color) +
  labs(x = "branch diameter", y = "length absolute error (cm) - node to node") +
  xlim(0,40) +
  geom_hline(yintercept = 0, color = "grey45") +
  theme(panel.background = element_rect(fill = "white", colour = "grey50")) 

## and length to end
mm <- as.data.frame(le$error.date1)
mm$d2 <- le$error.date2

le$min <- apply(mm, 1, FUN=min)
le$max <- apply(mm, 1, FUN=max)

les <- ggplot() +
  geom_linerange(data=le, 
                 mapping=aes(x=le$diam, 
                             ymin=le$min, 
                             ymax=le$max),
                 color = le$color,
                 size = 1,
                 show.legend = TRUE) +
  geom_point(data=le, 
             mapping=aes(x=le$diam, y=le$error.avg), 
             size=0.5, color = le$color) +
  labs(x = "branch diameter", y = "length absolute error (cm) - node to end") +
  xlim(0,18) +
  geom_hline(yintercept = 0, color = "grey45") +
  theme(panel.background = element_rect(fill = "white", colour = "grey50")) 



# make graph ----
jpeg("../OUT/FIGURE.diam.length.accuracy.size.jpg", width = 1800, height = 900)
ggarrange(ds, ls, les, ncol = 3, nrow = 1, labels = c("A", "B"),
          align = "hv", common.legend = TRUE)
dev.off()


