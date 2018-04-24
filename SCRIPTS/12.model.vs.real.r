# calculate error from reaal

all.data$error.date1 <- as.numeric(all.data$value.date1) -
  as.numeric(all.data$value.real)
 
all.data$perror.date1 <- all.data$error.date1/as.numeric(all.data$value.real)

all.data$error.date2 <- as.numeric(all.data$value.date2) -
  as.numeric(all.data$value.real)

all.data$perror.date2 <- all.data$error.date2/as.numeric(all.data$value.real)


plot(x = all.data$value.real[which(all.data$measurement == "length")],
     y = all.data$perror.date1[which(all.data$measurement == "length")],
     col = "blue")
points(x = all.data$value.real[which(all.data$measurement == "length")],
     y = all.data$perror.date2[which(all.data$measurement == "length")],
     col = "red")

mean(abs(all.data$error.date1[which(all.data$measurement == "diameter")]), na.rm = TRUE)
mean(abs(all.data$error.date1[which(all.data$measurement == "length" & 
                                      all.data$endpoint == "branch")]), na.rm = TRUE)
mean(abs(all.data$error.date2[which(all.data$measurement == "diameter")]), na.rm = TRUE)
mean(abs(all.data$error.date2[which(all.data$measurement == "length" & 
                                      all.data$endpoint == "branch")]), na.rm = TRUE)

