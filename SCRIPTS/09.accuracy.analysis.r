

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
ggarrange(ds, ls, les, ncol = 3, nrow = 1, labels = c("A", "B", "C"),
          align = "hv", common.legend = TRUE)
dev.off()

