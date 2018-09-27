
# do it without lines ----
ds <- ggplot() +
  xlim(0,40) +
  ylim(-5, 15) + 
  geom_point(data=d.all.data, 
             aes(x=d.all.data$value.real, 
                 y=d.all.data$error.avg), 
             size=2.5, color = d.all.data$color) +
  labs(x = "", y = "diameter error (cm)") +
  geom_hline(yintercept = 0, color = "grey45") +
  theme(panel.background = element_rect(fill = "white", colour = "grey50"))


ls <- ggplot() +
  geom_point(data=lb, 
             mapping=aes(x=lb$diam, y=lb$error.avg), 
             size=2.5, color = lb$color) +
  labs(x = "", y = "length error (cm) - node to node") +
  xlim(0,40) +
  geom_hline(yintercept = 0, color = "grey45") +
  theme(panel.background = element_rect(fill = "white", colour = "grey50")) 

les <- ggplot() +
  geom_point(data=le, 
             mapping=aes(x=le$diam, y=le$error.avg), 
             size=2.5, color = le$color) +
  labs(x = "branch diameter (cm)", y = "length error (cm) - node to end") +
  xlim(0,18) +
  geom_hline(yintercept = 0, color = "grey45") +
  theme(panel.background = element_rect(fill = "white", colour = "grey50")) 



figure <- ggarrange(ds, ls, les, ncol = 1, nrow = 3, labels = c("A", "B", "C"),
                    common.legend = TRUE)
ggsave(plot = figure, "../OUT/FIGURE.diam.length.accuracy.size-nolines.jpg", width = 5,
       height = 10)



# do it without lines ----
ds <- ggplot() +
  xlim(0,40) +
  ylim(-5, 15) + 
  geom_point(data=d.all.data, 
             aes(x=d.all.data$value.real, 
                 y=d.all.data$error.date1), 
             size=2, color = d.all.data$color) +
  geom_point(data=d.all.data, 
             aes(x=d.all.data$value.real, 
                 y=d.all.data$error.date2), 
             size=2, color = d.all.data$color) +
  labs(x = "", y = "diameter error (cm)") +
  geom_hline(yintercept = 0, color = "grey45") +
  theme(panel.background = element_rect(fill = "white", colour = "grey50"))


ls <- ggplot() +
  geom_point(data=lb, 
             mapping=aes(x=lb$diam, y=lb$error.date1), 
             size=2, color = lb$color) +
  geom_point(data=lb, 
             mapping=aes(x=lb$diam, y=lb$error.date2), 
             size=2, color = lb$color) +
  labs(x = "", y = "length error (cm) - node to node") +
  xlim(0,40) +
  geom_hline(yintercept = 0, color = "grey45") +
  theme(panel.background = element_rect(fill = "white", colour = "grey50")) 

les <- ggplot() +
  geom_point(data=le, 
             mapping=aes(x=le$diam, y=le$error.date1), 
             size=2, color = le$color) +
  labs(x = "branch diameter (cm)", y = "length error (cm) - node to end") +
  geom_point(data=le, 
             mapping=aes(x=le$diam, y=le$error.date2), 
             size=2, color = le$color) +
  labs(x = "branch diameter (cm)", y = "length error (cm) - node to end") +
  xlim(0,18) +
  geom_hline(yintercept = 0, color = "grey45") +
  theme(panel.background = element_rect(fill = "white", colour = "grey50")) 




figure <- ggarrange(ds, ls, les, ncol = 1, nrow = 3, labels = c("A", "B", "C"),
                    common.legend = TRUE)
ggsave(plot = figure, "../OUT/FIGURE.diam.length.accuracy.size-nolines2.jpg", width = 5,
       height = 10)