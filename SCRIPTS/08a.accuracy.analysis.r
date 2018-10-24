

### set up for diameter error by size figure ----
mm <- as.data.frame(d.all.data$error.date1)
mm$d2 <- d.all.data$error.date2

d.all.data$min <- apply(mm, 1, FUN=min, na.rm = TRUE)
d.all.data$max <- apply(mm, 1, FUN=max, na.rm = TRUE)

d.all.data$min[which(d.all.data$min == Inf)] <- NA
d.all.data$max[which(d.all.data$max == Inf)] <- NA


d.s <- ggplot() +
  geom_linerange(data=d.all.data, 
                 mapping=aes(x=d.all.data$value.real, 
                             ymin=d.all.data$min, 
                             ymax=d.all.data$max),
                 color = d.all.data$color,
                 size = 0.4,
                 show.legend = TRUE) +
  xlim(0,40) +
  ylim(-5, 15) +
  labs(x = "", y = "error (cm)") +
  geom_hline(yintercept = 0, color = "grey55") +
  theme(panel.background = element_rect(fill = "white", colour = "grey50"),
        axis.text=element_text(size=10),
        axis.title=element_text(size=10))
  


### set up for length error by size figure ----
mm <- as.data.frame(lb$error.date1)
mm$d2 <- lb$error.date2

lb$min <- apply(mm, 1, FUN=min)
lb$max <- apply(mm, 1, FUN=max)


lb$min[which(lb$min == Inf)] <- NA
lb$max[which(lb$max == Inf)] <- NA


l.s <- ggplot() +
  geom_linerange(data=lb, 
                 mapping=aes(x=lb$diam, 
                             ymin=lb$min, 
                             ymax=lb$max),
                 color = lb$color,
                 size = 0.4,
                 show.legend = TRUE) +
  labs(x = "", y = "error (cm)") +
  xlim(0,40) +
  geom_hline(yintercept = 0, color = "grey55") +
  theme(panel.background = element_rect(fill = "white", colour = "grey50"),
        axis.text=element_text(size=10),
        axis.title=element_text(size=10)) 

## and length to end
mm <- as.data.frame(le$error.date1)
mm$d2 <- le$error.date2

le$min <- apply(mm, 1, FUN=min)
le$max <- apply(mm, 1, FUN=max)

le$min[which(le$min == Inf)] <- NA
le$max[which(le$max == Inf)] <- NA


l.es <- ggplot() +
  geom_linerange(data=le, 
                 mapping=aes(x=le$diam, 
                             ymin=le$min, 
                             ymax=le$max),
                 color = le$color,
                 size = 0.4,
                 show.legend = TRUE) +
  labs(x = "branch diameter (cm)", y = "error (cm)") +
  xlim(0,18) +
  geom_hline(yintercept = 0, color = "grey55") +
  theme(panel.background = element_rect(fill = "white", colour = "grey50"),
        axis.text=element_text(size=10),
        axis.title=element_text(size=10)) 


figure <- ggarrange(d.s, l.s, l.es, ncol = 1, nrow = 3, labels = c("A", "B", "C"),
          common.legend = TRUE, align = "hv")
ggsave(plot = figure, "../OUT/FIGURE2.diam.length.accuracy.size.jpg", width = 3.3,
       height = 8)



