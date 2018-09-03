
# make new column with average of two values
comb.all.data$value.avg <- (comb.all.data$value.date1 + 
                              comb.all.data$value.date2) / 2


# calculate error and p error from real

comb.all.data$error.date1 <- as.numeric(comb.all.data$value.date1) -
  as.numeric(comb.all.data$value.real)
 
comb.all.data$perror.date1 <- abs(comb.all.data$error.date1/
                                    as.numeric(comb.all.data$value.real)) * 100

comb.all.data$error.date2 <- as.numeric(comb.all.data$value.date2) -
  as.numeric(comb.all.data$value.real)

comb.all.data$perror.date2 <- abs(comb.all.data$error.date2/
                                    as.numeric(comb.all.data$value.real)) * 100

comb.all.data$error.avg <- as.numeric(comb.all.data$value.avg) -
  as.numeric(comb.all.data$value.real)

comb.all.data$perror.avg <- abs(comb.all.data$error.avg/
                                  as.numeric(comb.all.data$value.real)) * 100
