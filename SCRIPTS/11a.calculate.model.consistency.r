# calculate percent error between models
comb.all.data$error <- comb.all.data$value.date1 - comb.all.data$value.date2
comb.all.data$perror <- (comb.all.data$error / comb.all.data$value.date2) * 100

