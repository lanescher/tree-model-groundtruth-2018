# model vs real analysis


library(ggplot2)

# correlations between model and real
summary(lm(all.data$vert.dist[which(all.data$measurement == "length" & all.data$endpoint == "branch")] ~ 
             all.data$perror.avg[which(all.data$measurement == "length" & all.data$endpoint == "branch")]))
?subset

summary(lm(all.data$perror.avg[which(all.data$measurement == "diameter")] ~ 
             all.data$value.real[which(all.data$measurement == "diameter")]))

ggplot(data = subset(all.data, all.data$measurement == "length" & all.data$endpoint == "branch"),
       aes(x = all.data$value.real[which(all.data$measurement == "length" & all.data$endpoint == "branch")], 
           y = all.data$value.avg[which(all.data$measurement == "length" & all.data$endpoint == "branch")])) +
  geom_point()


categories = c("value.real")
predictors = c("diameter", "length")
dates = c("date1", "date2", "avg")
endpoints = c("branch", "end")


names.test <- c("all.date1", "all.date2", "all.avg", 
                "diameter.date1", "length.date1", 
                "diameter.date2", "length.date2", 
                "diameter.avg", "length.avg",
                "length.branch.date1", "length.end.date1", 
                "length.branch.date2", "length.end.date2",
                "length.branch.avg", "length.end.avg",
                "diameter.over5.date1", "diameter.over5.date2", "diameter.over5.avg")

# R2 for ALL values, both dates
i <- 1
rsqrs <- c()
coefs <- c()
for (i in 1:length(dates)) {
  lm.test <- lm(all.data$value.real ~ 
                  all.data[[paste("value.", dates[i], sep = "")]])
  rsqrs[length(rsqrs) + 1] <- summary(lm.test)$adj.r.squared
  coefs[length(coefs) + 1] <- summary(lm.test)$coef[2,1]
  i <- i + 1
}

# R2 for diameter and length, both dates
i <- 1
for (i in 1:length(dates)) {
  j <- 1
  for (j in 1:length(predictors)) {
    lm.test <- lm(all.data$value.real[which(all.data$measurement == predictors[j])] ~
                    all.data[[paste("value.", dates[i], sep = "")]][which(all.data$measurement == predictors[j])])
    rsqrs[length(rsqrs) + 1] <- summary(lm.test)$adj.r.squared
    coefs[length(coefs) + 1] <- summary(lm.test)$coef[2,1]
    j <- j + 1
  }
  j <- j + 1
}


# R2 for length by endpoint
i <- 1
for (i in 1:length(dates)) {
  k <- 1
  for (k in 1:length(endpoints)) {
    lm.test <- lm(all.data$value.real[which(all.data$measurement == predictors[2] & all.data$endpoint == endpoints[k])] ~
                    all.data[[paste("value.", dates[i], sep = "")]][which(all.data$measurement == predictors[2] & all.data$endpoint == endpoints[k])])
    rsqrs[length(rsqrs) + 1] <- summary(lm.test)$adj.r.squared
    coefs[length(coefs) + 1] <- summary(lm.test)$coef[2,1]
    k <- k + 1
  }
  i <- i + 1
}


# R2 for diameter by size
i <- 1
for (i in 1:length(dates)) {
    lm.test <- lm(all.data$value.real[which(all.data$measurement == predictors[1] & all.data$value.real > 5)] ~
                    all.data[[paste("value.", dates[i], sep = "")]][which(all.data$measurement == predictors[1] & all.data$value.real > 5)])
    rsqrs[length(rsqrs) + 1] <- summary(lm.test)$adj.r.squared
    coefs[length(coefs) + 1] <- summary(lm.test)$coef[2,1]
  i <- i + 1
}



all.rsqrs <- as.data.frame(c(names.test))
colnames(all.rsqrs) <- "name"
all.rsqrs$value <- rsqrs


ggplot(data = all.rsqrs, 
       aes(x = all.rsqrs$name, y = all.rsqrs$value)) +
  geom_point() +
  theme(axis.text.x = element_text(angle = 45)) +
  scale_x_discrete(name = "predictor", 
                   limits=c("all.date1", "all.date2", "all.avg", 
                            "diameter.date1", "diameter.date2", "diameter.avg",
                            "length.date1", "length.date2", "length.avg",
                            "length.branch.date1", "length.branch.date2", "length.branch.avg", 
                            "length.end.date1", "length.end.date2", "length.end.avg",
                            "diameter.over5.date1", "diameter.over5.date2", "diameter.over5.avg"))

rmse(all.data$error.date1[which(all.data$measurement == "length" & 
                                  all.data$endpoint == "branch")])


all.data.diameter <- all.data[which(all.data$measurement == "diameter"),]
all.data.length <- all.data[which(all.data$measurement == "length"),]
m.all.data <- merge(all.data.diameter, all.data.length, by = c("node", "branch", "endpoint",
                                                               "is.in", "vert.dist", "center.dist", "hor.dist",
                                                               "theta", "main.nodeto", "branch.nodeto"))

ggplot(data = subset(all.data[which(m.all.data$value.real.x > 5 &
                                      m.all.data$endpoint == "branch" & 
                                      m.all.data$broken.real.y != "b" &
                                      m.all.data$broken.real.y != "bm"),]),
       aes(x = m.all.data$value.avg.y[which(m.all.data$value.real.x > 5 &
                                              m.all.data$endpoint == "branch" & 
                                              m.all.data$broken.real.y != "b" &
                                              m.all.data$broken.real.y != "bm")], 
           y = m.all.data$value.real.y[which(m.all.data$value.real.x > 5 &
                                               m.all.data$endpoint == "branch" & 
                                               m.all.data$broken.real.y != "b" &
                                               m.all.data$broken.real.y != "bm")])) +
  geom_point(col = "chartreuse4") +
  geom_abline(col = "red") +
  scale_x_continuous(name = "model length", limits = c(1, 210)) +
  scale_y_continuous(name = "actual length", limits = c(1, 210)) +
  geom_smooth(method = "lm", se = FALSE, col = "dark green")




#plots

ggplot(data = subset(all.data[which(all.data$value.real > 5 & 
                                      all.data$measurement == "diameter"),]),
       aes(x = all.data$value.avg[which(all.data$value.real > 5 & 
                                          all.data$measurement == "diameter")], 
           y = all.data$value.real[which(all.data$value.real > 5 & 
                                           all.data$measurement == "diameter")])) +
  geom_point(col = "medium blue") +
  geom_abline(col = "red") +
  scale_x_continuous(name = "model diameter", limits = c(1, 45)) +
  scale_y_continuous(name = "actual diameter", limits = c(1, 45)) +
  geom_smooth(method = "lm", se = FALSE, col = "dark blue")

ggplot(data = subset(all.data[which(all.data$measurement == "diameter"),]),
       aes(x = all.data$value.avg[which(all.data$measurement == "diameter")], 
           y = all.data$value.real[which(all.data$measurement == "diameter")])) +
  geom_point(col = "medium blue") +
  geom_abline(col = "red") +
  scale_x_continuous(name = "model diameter", limits = c(1, 45)) +
  scale_y_continuous(name = "actual diameter", limits = c(1, 45)) +
  geom_smooth(method = "lm", se = FALSE, col = "dark blue")


ggplot(data = subset(all.data[which(all.data$endpoint == "branch" & 
                                      all.data$measurement == "length" &
                                      all.data$broken.real != "b" &
                                      all.data$broken.real != "bm"),]),
       aes(x = all.data$value.avg[which(all.data$endpoint == "branch" & 
                                          all.data$measurement == "length" &
                                          all.data$broken.real != "b" &
                                          all.data$broken.real != "bm")], 
           y = all.data$value.real[which(all.data$endpoint == "branch" & 
                                           all.data$measurement == "length" &
                                           all.data$broken.real != "b" &
                                           all.data$broken.real != "bm")])) +
  geom_point(col = "chartreuse4") +
  geom_abline(col = "red") +
  scale_x_continuous(name = "model length", limits = c(1, 210)) +
  scale_y_continuous(name = "actual length", limits = c(1, 210)) +
  geom_smooth(method = "lm", se = FALSE, col = "dark green") +
  geom_text(aes(label=all.data$node[which(all.data$endpoint == "branch" & 
                                            all.data$measurement == "length" &
                                            all.data$broken.real != "b" &
                                            all.data$broken.real != "bm")]),hjust=0, vjust=0)






plot(x = all.data$value.real[which(all.data$measurement == "diameter")],
     y = all.data$perror.date1[which(all.data$measurement == "diameter")],
     col = "blue")
smooth(x = all.data$value.real[which(all.data$measurement == "diameter")],
       y = all.data$perror.date2[which(all.data$measurement == "diameter")],
       col = "red")
points(x = all.data$value.real[which(all.data$measurement == "diameter")],
       y = all.data$perror.avg[which(all.data$measurement == "diameter")],
       col = "purple")

boxplot(perror.avg)

mean(abs(all.data$error.date1[which(all.data$measurement == "diameter")]), na.rm = TRUE)
mean(abs(all.data$error.date1[which(all.data$measurement == "length" & 
                                      all.data$endpoint == "branch")]), na.rm = TRUE)
mean(abs(all.data$error.date2[which(all.data$measurement == "diameter")]), na.rm = TRUE)
mean(abs(all.data$error.date2[which(all.data$measurement == "length" & 
                                      all.data$endpoint == "branch")]), na.rm = TRUE)


plot(x = all.data$value.date1[which(all.data$measurement == "diameter" & as.numeric(all.data$value.real) >= 5)], 
     y = all.data$value.real[which(all.data$measurement == "diameter" & as.numeric(all.data$value.real) >= 5)],
     col = "blue")
points(x = all.data$value.date2[which(all.data$measurement == "diameter" & as.numeric(all.data$value.real) >= 5)], 
       y = all.data$value.real[which(all.data$measurement == "diameter" & as.numeric(all.data$value.real) >= 5)],
       col = "red")
rmse(all.data$perror.date1[which(all.data$measurement == "diameter" & as.numeric(all.data$value.real) >= 10)])

plot(x = all.data$value.date1[which(all.data$measurement == "length")], y = all.data$value.real[which(all.data$measurement == "length")])
points(x = all.data$value.date2[which(all.data$measurement == "length")], y = all.data$value.real[which(all.data$measurement == "length")])



plot(x = all.data$value.date1[which(all.data$value.real > 5)], y = all.data$value.real[which(all.data$value.real > 5)])
points(x = all.data$value.date2[which(all.data$value.real > 5)], y = all.data$value.real[which(all.data$value.real > 5)], col = "blue")


summary(lm(all.data$value.real[which(all.data$value.real < 5 & all.data$measurement == "diameter")] ~ 
             all.data$value.date1[which(all.data$value.real < 5 & all.data$measurement == "diameter")]))


plot(x = all.data$value.date1[which(all.data$measurement == "length" & all.data$endpoint == "branch")], 
     y = all.data$value.real[which(all.data$measurement == "length" & all.data$endpoint == "branch")])
points(x = all.data$value.date2[which(all.data$measurement == "length" & all.data$endpoint == "branch")], 
       y = all.data$value.real[which(all.data$measurement == "length" & all.data$endpoint == "branch")],
       col = "blue")

summary(lm(all.data$value.date2[which(all.data$measurement == "length" & all.data$endpoint == "branch")] ~ 
             all.data$value.real[which(all.data$measurement == "length" & all.data$endpoint == "branch")]))

plot(x = all.data$center.dist[which(all.data$measurement == "diameter")], 
     y = all.data$perror.date1[which(all.data$measurement == "diameter")])

mean(all.data$perror.date1[which(all.data$measurement == "diameter" & all.data$value.real > 25)], na.rm = TRUE)
rmse(all.data$perror.date2[which(all.data$measurement == "length" & all.data$value.real > 5 & all.data$endpoint == "branch")])
