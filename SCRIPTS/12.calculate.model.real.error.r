# read in all data
source("SCRIPTS/09.reshape.data.with.real.r")



# make new column with average of two values
i <- 1
value.avg <- c(1:length(all.data$value.date1))
for (i in 1:length(all.data$value.date1)) {
  value <- (all.data$value.date1[i] + all.data$value.date2[i]) / 2
  value.avg[i] <- value
  i <- i + 1
}
all.data$value.avg <- value.avg


# calculate error and p error from real

all.data$error.date1 <- as.numeric(all.data$value.date1) -
  as.numeric(all.data$value.real)
 
all.data$perror.date1 <- abs(all.data$error.date1/as.numeric(all.data$value.real)) * 100

all.data$error.date2 <- as.numeric(all.data$value.date2) -
  as.numeric(all.data$value.real)

all.data$perror.date2 <- abs(all.data$error.date2/as.numeric(all.data$value.real)) * 100

all.data$error.avg <- as.numeric(all.data$value.avg) -
  as.numeric(all.data$value.real)

all.data$perror.avg <- abs(all.data$error.avg/as.numeric(all.data$value.real)) * 100
