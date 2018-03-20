# start testing how consistent measurements are from one model to another
getwd()
library(ggplot2)
source("SCRIPTS/10.define.error.functions.r")

# calculate percent error between models
all.data$error <- all.data$value.date1 - all.data$value.date2
all.data$perror <- all.data$error / all.data$value.date2

rmse(all.data$error[which(all.data$measurement == "diameter"
                          & all.data$error != "NA")])

rmse(all.data$error[which(all.data$measurement == "length"
                          & all.data$error != "NA")])

rmse(all.data$error[which(all.data$measurement == "diameter"
                          & all.data$error != "NA" 
                          & all.data$endpoint != "end")])

mean(all.data$error[which(all.data$measurement == "diameter"
                          & all.data$error != "NA")])

mean(all.data$error[which(all.data$measurement == "length"
                          & all.data$error != "NA")])

mean(all.data$error[which(all.data$measurement == "diameter"
                          & all.data$error != "NA" 
                          & all.data$endpoint != "end")])

mae(all.data$error[which(all.data$measurement == "diameter"
                          & all.data$error != "NA")])

mae(all.data$error[which(all.data$measurement == "length"
                          & all.data$error != "NA")])

mae(all.data$error[which(all.data$measurement == "diameter"
                          & all.data$error != "NA" 
                          & all.data$endpoint != "end")])

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

