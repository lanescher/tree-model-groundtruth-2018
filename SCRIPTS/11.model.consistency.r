# start testing how consistent measurements are from one model to another

# calculate percent error between models
comb.all.data$error <- comb.all.data$value.date1 - comb.all.data$value.date2
comb.all.data$perror <- (comb.all.data$error / comb.all.data$value.date2) * 100


# analysis
rmse(comb.all.data$error[which(comb.all.data$measurement == "diameter")])
rmse(comb.all.data$error[which(comb.all.data$measurement == "length" & comb.all.data$endpoint == "branch")])

ggplot(data = comb.all.data, 
       aes(x = comb.all.data$value.date1, y = comb.all.data$value.date2)) +
  geom_point(aes(color = factor(comb.all.data$tree), 
                 shape = factor(comb.all.data$measurement)))
  
ggplot(data = subset(comb.all.data, comb.all.data$measurement == "diameter"), 
       aes(x = comb.all.data$value.date1[which(comb.all.data$measurement == "diameter")], 
           y = comb.all.data$value.date2[which(comb.all.data$measurement == "diameter")])) +
  geom_point(aes(color = factor(comb.all.data$tree[which(comb.all.data$measurement == "diameter")]))) +
  geom_smooth(method = "lm", 
              aes(color = factor(comb.all.data$tree[which(comb.all.data$measurement == "diameter")])))

ggplot(data = subset(comb.all.data, comb.all.data$measurement == "length" & comb.all.data$endpoint == "branch"), 
       aes(x = comb.all.data$value.date1[which(comb.all.data$measurement == "length" & comb.all.data$endpoint == "branch")], 
           y = comb.all.data$value.date2[which(comb.all.data$measurement == "length" & comb.all.data$endpoint == "branch")])) +
  geom_point(aes(color = factor(comb.all.data$tree[which(comb.all.data$measurement == "length" & comb.all.data$endpoint == "branch")]))) +
  geom_smooth(method = "lm", 
              aes(color = factor(comb.all.data$tree[which(comb.all.data$measurement == "length" & comb.all.data$endpoint == "branch")]))) 

#+geom_text(aes(label = comb.all.data$node[which(comb.all.data$measurement == "length" & comb.all.data$endpoint == "branch")]))

summary(aov(all.data$perror[which(all.data$perror != "NA" & 
                                    all.data$perror != Inf & 
                                    all.data$measurement == "length" &
                                    all.data$endpoint == "end")] ~ 
              all.data$vert.dist[which(all.data$perror != "NA" &
                                         all.data$perror != Inf & 
                                         all.data$measurement == "length" &
                                         all.data$endpoint == "end")]))

plot(all.data$perror[which(all.data$perror != "NA" & all.data$perror != Inf & 
                             all.data$measurement == "length")] ~ 
       all.data$theta[which(all.data$perror != "NA" & all.data$perror != Inf & 
                                  all.data$measurement == "length")])
lines(y = all.data$perror[which(all.data$perror != "NA" & all.data$perror != Inf)], 
            x = all.data$vert.dist[which(all.data$perror != "NA" & all.data$perror != Inf)])

plot(x = all.data$theta, y = all.data$center.dist)

### PLOTTING
title <- "percent error"

da.ta <- all.data

xvar <- all.data$measurement 
x.lab <- "measurement type"

yvar <- all.data$perror
y.lab <- "percent error"

color <- all.data$endpoint


ggplot(data = da.ta, aes(x = xvar, y = yvar)) +
  geom_point() +
  labs(x = x.lab, y = y.lab) +
  ggtitle(title) 

ggplot(data = da.ta, aes(x = all.data$measurement, y = yvar)) +
  geom_boxplot(aes(col = color)) +
  xlab(x.lab) + ylab(y.lab) +
  scale_y_log10(breaks = c("0.01", "1.0", "100.0"), labels = c("0.01", "1.0", "100.0")) +
  ggtitle(title) 

plot(x = all.data$hor.dist[which(all.data$main.nodeto != "end")], y = all.data$maindiameter.err[which(all.data$main.nodeto != "end")])

hist(all.data$maindiameter.err)

