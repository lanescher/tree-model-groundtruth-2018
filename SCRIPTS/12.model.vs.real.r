# calculate error from real

all.data$error.date1 <- as.numeric(all.data$value.date1) -
  as.numeric(all.data$value.real)
 
all.data$perror.date1 <- abs(all.data$error.date1/as.numeric(all.data$value.real)) * 100

all.data$error.date2 <- as.numeric(all.data$value.date2) -
  as.numeric(all.data$value.real)

all.data$perror.date2 <- abs(all.data$error.date2/as.numeric(all.data$value.real)) * 100

i <- 1
value.avg <- c(1:length(all.data$value.date1))
for (i in 1:length(all.data$value.date1)) {
  value <- (all.data$value.date1[i] + all.data$value.date2[i]) / 2
  value.avg[i] <- value
  i <- i + 1
}
all.data$value.avg <- value.avg

all.data$error.avg <- as.numeric(all.data$value.avg) -
  as.numeric(all.data$value.real)

all.data$perror.avg <- abs(all.data$error.avg/as.numeric(all.data$value.real)) * 100





#plots


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


plot(x = all.data$value.date1[which(all.data$measurement == "diameter" & as.numeric(all.data$value.real) <= 5)], 
     y = all.data$value.real[which(all.data$measurement == "diameter" & as.numeric(all.data$value.real) <= 5)],
     col = "blue")
points(x = all.data$value.date2[which(all.data$measurement == "diameter" & as.numeric(all.data$value.real) >= 5)], 
       y = all.data$value.real[which(all.data$measurement == "diameter" & as.numeric(all.data$value.real) >= 5)],
       col = "red")


plot(x = all.data$value.date1[which(all.data$measurement == "length")], y = all.data$value.real[which(all.data$measurement == "length")])
points(x = all.data$value.date2[which(all.data$measurement == "length")], y = all.data$value.real[which(all.data$measurement == "length")])



plot(x = all.data$value.date1[which(all.data$value.real > 5)], y = all.data$value.real[which(all.data$value.real > 5)])
points(x = all.data$value.date2[which(all.data$value.real > 5)], y = all.data$value.real[which(all.data$value.real > 5)], col = "blue")


summary(lm(all.data$value.real[which(all.data$value.real < 5)] ~ all.data$value.date1[which(all.data$value.real < 5)]))


plot(x = all.data$value.date1[which(all.data$measurement == "length" & all.data$endpoint == "branch")], 
     y = all.data$value.real[which(all.data$measurement == "length" & all.data$endpoint == "branch")])
points(x = all.data$value.date2[which(all.data$measurement == "length" & all.data$endpoint == "branch")], 
     y = all.data$value.real[which(all.data$measurement == "length" & all.data$endpoint == "branch")],
     col = "blue")

summary(lm(all.data$value.date1[which(all.data$measurement == "length" & all.data$endpoint == "branch")] ~ 
             all.data$value.real[which(all.data$measurement == "length" & all.data$endpoint == "branch")]))

plot(x = all.data$hor.dist[which(all.data$measurement == "diameter")], 
     y = all.data$perror.date1[which(all.data$measurement == "diameter")])

mean(all.data$perror.date1[which(all.data$measurement == "diameter" & all.data$value.real > 25)], na.rm = TRUE)
rmse(all.data$perror.date1[which(all.data$measurement == "diameter" & all.data$value.real > 4.5)])
