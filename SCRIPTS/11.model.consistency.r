# start testing how consistent measurements are from one model to another

setwd("C:/Users/lscher/Documents/Github/tree-model-groundtruth-2018")


tree <- "memorialoak"
branches <- c("01", "03", "05", "08", "09", "10", "13")
branch <- c("01", "03", "05", "08", "09", "10", "13")
date1 <- "171221"
date2 <- "180109"
dates <- c("171221", "180109")

tree <- "walnut2"
branches <- c("01", "06", "07", "11", "12", "13", "14")
branch <- c("01", "06", "07", "11", "12", "13", "14")
date1 <- "180228"
date2 <- "180328"
dates <- c("180228", "180328")


library(ggplot2)
source("SCRIPTS/09a.reshape.data.without.real.r")
source("SCRIPTS/10.define.error.functions.r")



# calculate percent error between models
all.data$error <- all.data$value.date1 - all.data$value.date2
all.data$perror <- (all.data$error / all.data$value.date2) * 100

walnut2.all.data <- all.data
walnut2.all.data$tree <- "walnut2"
memorialoak.all.data <- all.data
memorialoak.all.data$tree <- "memorialoak"

comb.all.data <- rbind(walnut2.all.data, memorialoak.all.data)


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
              aes(color = factor(comb.all.data$tree[which(comb.all.data$measurement == "length" & comb.all.data$endpoint == "branch")]))) +
  geom_text(aes(label = comb.all.data$node[which(comb.all.data$measurement == "length" & comb.all.data$endpoint == "branch")]))

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

