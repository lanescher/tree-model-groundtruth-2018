# consistency analysis

# diameter consistency error ----
d.c <- ggplot(data = d.all.data, aes(x = d.all.data$value.real, y = abs(d.all.data$error))) +
  geom_point(aes(color = d.all.data$tree)) +
  labs(x = "branch diameter", y = "diameter error (cm)") +
  geom_hline(yintercept = 0, color = "grey45") +
  theme(panel.background = element_rect(fill = "white", colour = "grey50"),
        legend.background = element_blank(),
        legend.key = element_blank()) +
  scale_color_manual(values=c("brown4", "cornflowerblue", "goldenrod2"),
                     name = "Tree",
                     labels = c("Elm", "Oak", "Walnut"))

# length to branch consistency error ----
l.bc <- ggplot(data = lb, aes(x = lb$diam, y = abs(lb$error))) +
  geom_point(aes(color = lb$tree)) +
  labs(x = "branch diameter", y = "length error (cm) - to node") +
  geom_hline(yintercept = 0, color = "grey45") +
  theme(panel.background = element_rect(fill = "white", colour = "grey50"),
        legend.background = element_blank(),
        legend.key = element_blank()) +
  scale_color_manual(values=c("brown4", "cornflowerblue", "goldenrod2"),
                     name = "Tree",
                     labels = c("Elm", "Oak", "Walnut"))

# length to end consistency error ----
l.ec <- ggplot(data = le, aes(x = le$diam, y = abs(le$error))) +
  geom_point(aes(color = le$tree)) +
  labs(x = "branch diameter", y = "length error (cm) - to end") +
  geom_hline(yintercept = 0, color = "grey45") +
  theme(panel.background = element_rect(fill = "white", colour = "grey50"),
                legend.background = element_blank(),
                legend.key = element_blank()) +
  scale_color_manual(values=c("brown4", "cornflowerblue", "goldenrod2"),
                              name = "Tree",
                     labels = c("Elm", "Oak", "Walnut"))


figure <- ggarrange(d.c, l.bc, l.ec, ncol = 3, nrow = 1, labels = c("A", "B", "C"),
          align = "hv", common.legend = TRUE, legend = "bottom",
          label.x = .88, label.y = .97)
ggsave(plot = figure, "../OUT/FIGURE.consistency.jpg",
       width = 10, height = 5)
