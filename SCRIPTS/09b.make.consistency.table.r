# Make table with diameter class error


stderr <- function(x) sd(x)/sqrt(length(x))

# classes will be <3, 3-5, 5-10, 10-20, 30-40, 40+


# make df with diam errors
diamerror <- as.data.frame(abs(d.all.data$value.real[which(is.na(d.all.data$error.date1) == FALSE & 
                                                         is.na(d.all.data$error.date2) == FALSE)]))
diamerror$error <- abs(d.all.data$error[which(is.na(d.all.data$error.date1) == FALSE & 
                                                  is.na(d.all.data$error.date2) == FALSE)])
diamerror$perror <- abs(d.all.data$perror[which(is.na(d.all.data$perror.date1) ==FALSE & 
                                                    is.na(d.all.data$error.date2) == FALSE)])
colnames(diamerror) <- c("value.real", "error", "perror")

alldiamerror <- diamerror

classes <- c("<3", "3-5", "5-10", "10-20", "20-30", ">30")
err <- as.data.frame(classes)
err$no <- NA
err$diam.abs <- NA
err$diam.rel <- NA

# class <3
n <- length(alldiamerror$value.real[which(alldiamerror$value.real < 3)])
err[1,2] <- n
m <- mean(alldiamerror$error[which(alldiamerror$value.real < 3)])
std <- stderr(alldiamerror$error[which(alldiamerror$value.real < 3)])
err[1,3] <- paste(format(round(m, 2), nsmall = 2), "+-", 
                  format(round(std, 2), nsmall = 2))

drel <- mean(alldiamerror$perror[which(alldiamerror$value.real < 3)])
err[1,4] <- paste0(format(round(drel, 2), nsmall = 2), "%")

# class 3-5
n <- length(alldiamerror$value.real[which(alldiamerror$value.real >= 3 & alldiamerror$value.real < 5)])
err[2,2] <- n
m <- mean(alldiamerror$error[which(alldiamerror$value.real >= 3 & alldiamerror$value.real < 5)])
std <- stderr(alldiamerror$error[which(alldiamerror$value.real >= 3 & alldiamerror$value.real < 5)])
err[2,3] <- paste(format(round(m, 2), nsmall = 2), "+-", 
                  format(round(std, 2), nsmall = 2))

drel <- mean(alldiamerror$perror[which(alldiamerror$value.real >= 3 & alldiamerror$value.real < 5)])
err[2,4] <- paste0(format(round(drel, 2), nsmall = 2), "%")


# class 5-10
n <- length(alldiamerror$value.real[which(alldiamerror$value.real >= 5 & alldiamerror$value.real < 10)])
err[3,2] <- n
m <- mean(alldiamerror$error[which(alldiamerror$value.real >= 5 & alldiamerror$value.real < 10)])
std <- stderr(alldiamerror$error[which(alldiamerror$value.real >= 5 & alldiamerror$value.real < 10)])
err[3,3] <- paste(format(round(m, 2), nsmall = 2), "+-", 
                  format(round(std, 2), nsmall = 2))

drel <- mean(alldiamerror$perror[which(alldiamerror$value.real >= 5 & alldiamerror$value.real < 10)])
err[3,4] <- paste0(format(round(drel, 2), nsmall = 2), "%")

# class 10-20
n <- length(alldiamerror$value.real[which(alldiamerror$value.real >= 10 & alldiamerror$value.real < 20)])
err[4,2] <- n
m <- mean(alldiamerror$error[which(alldiamerror$value.real >= 10 & alldiamerror$value.real < 20)])
std <- stderr(alldiamerror$error[which(alldiamerror$value.real >= 10 & alldiamerror$value.real < 20)])
err[4,3] <- paste(format(round(m, 2), nsmall = 2), "+-", 
                  format(round(std, 2), nsmall = 2))

drel <- mean(alldiamerror$perror[which(alldiamerror$value.real >= 10 & alldiamerror$value.real < 20)])
err[4,4] <- paste0(format(round(drel, 2), nsmall = 2), "%")


# class 20-30
n <- length(alldiamerror$value.real[which(alldiamerror$value.real >= 20 & alldiamerror$value.real < 30)])
err[5,2] <- n
m <- mean(alldiamerror$error[which(alldiamerror$value.real >= 20 & alldiamerror$value.real < 30)])
std <- stderr(alldiamerror$error[which(alldiamerror$value.real >= 20 & alldiamerror$value.real < 30)])
err[5,3] <- paste(format(round(m, 2), nsmall = 2), "+-", 
                  format(round(std, 2), nsmall = 2))

drel <- mean(alldiamerror$perror[which(alldiamerror$value.real >= 20 & alldiamerror$value.real < 30)])
err[5,4] <- paste0(format(round(drel, 2), nsmall = 2), "%")

# class 30+
n <- length(alldiamerror$value.real[which(alldiamerror$value.real >= 30)])
err[6,2] <- n
m <- mean(alldiamerror$error[which(alldiamerror$value.real >= 30)])
std <- stderr(alldiamerror$error[which(alldiamerror$value.real >= 30)])
err[6,3] <- paste(format(round(m, 2), nsmall = 2), "+-", 
                  format(round(std, 2), nsmall = 2))

drel <- mean(alldiamerror$perror[which(alldiamerror$value.real >= 30)])
err[6,4] <- paste0(format(round(drel, 2), nsmall = 2), "%")

diam.error.table <- err

## now for length, to branch ----

# make df with length errors
lenerror <- as.data.frame(abs(lb$diam[which(is.na(lb$error.date1) == FALSE &
                                              is.na(lb$error.date2) == FALSE)]))
lenerror$error <- abs(lb$error[which(is.na(lb$error.date1) == FALSE &
                                       is.na(lb$error.date2) == FALSE)])
lenerror$perror <- abs(lb$perror[which(is.na(lb$perror.date1) ==FALSE &
                                         is.na(lb$error.date2) == FALSE)])
colnames(lenerror) <- c("diam", "error", "perror")


alllenerror <- lenerror



classes <- c("<3", "3-5", "5-10", "10-20", "20-30", ">30")
err <- as.data.frame(classes)
err$no <- NA
err$diam.abs <- NA
err$diam.rel <- NA

# class < 3
n <- length(alllenerror$diam[which(alllenerror$diam < 3)])
err[1,2] <- n
m <- mean(alllenerror$error[which(alllenerror$diam < 3)])
std <- stderr(alllenerror$error[which(alllenerror$diam < 3)])
err[1,3] <- paste(format(round(m, 2), nsmall = 2), "+-", 
                  format(round(std, 2), nsmall = 2))

drel <- mean(alllenerror$perror[which(alllenerror$diam < 3)])
err[1,4] <- paste0(format(round(drel, 2), nsmall = 2), "%")

# class 3-5
n <- length(alllenerror$diam[which(alllenerror$diam >= 3 & alllenerror$diam < 5)])
err[2,2] <- n
m <- mean(alllenerror$error[which(alllenerror$diam >= 3 & alllenerror$diam < 5)])
std <- stderr(alllenerror$error[which(alllenerror$diam >= 3 & alllenerror$diam < 5)])
err[2,3] <- paste(format(round(m, 2), nsmall = 2), "+-", 
                  format(round(std, 2), nsmall = 2))

drel <- mean(alllenerror$perror[which(alllenerror$diam >= 3 & alllenerror$diam < 5)])
err[2,4] <- paste0(format(round(drel, 2), nsmall = 2), "%")

# class 5-10
n <- length(alllenerror$diam[which(alllenerror$diam >= 5 & alllenerror$diam < 10)])
err[3,2] <- n
m <- mean(alllenerror$error[which(alllenerror$diam >= 5 & alllenerror$diam < 10)])
std <- stderr(alllenerror$error[which(alllenerror$diam >= 5 & alllenerror$diam < 10)])
err[3,3] <- paste(format(round(m, 2), nsmall = 2), "+-", 
                  format(round(std, 2), nsmall = 2))

drel <- mean(alllenerror$perror[which(alllenerror$diam >= 5 & alllenerror$diam < 10)])
err[3,4] <- paste0(format(round(drel, 2), nsmall = 2), "%")


# class 10-20
n <- length(alllenerror$diam[which(alllenerror$diam >= 10 & alllenerror$diam < 20)])
err[4,2] <- n
m <- mean(alllenerror$error[which(alllenerror$diam >= 10 & alllenerror$diam < 20)])
std <- stderr(alllenerror$error[which(alllenerror$diam >= 10 & alllenerror$diam < 20)])
err[4,3] <- paste(format(round(m, 2), nsmall = 2), "+-", 
                  format(round(std, 2), nsmall = 2))

drel <- mean(alllenerror$perror[which(alllenerror$diam >= 10 & alllenerror$diam < 20)])
err[4,4] <- paste0(format(round(drel, 2), nsmall = 2), "%")


# class 20-30
n <- length(alllenerror$diam[which(alllenerror$diam >= 20 & alllenerror$diam < 30)])
err[5,2] <- n
m <- mean(alllenerror$error[which(alllenerror$diam >= 20 & alllenerror$diam < 30)])
std <- stderr(alllenerror$error[which(alllenerror$diam >= 20 & alllenerror$diam < 30)])
err[5,3] <- paste(format(round(m, 2), nsmall = 2), "+-", 
                  format(round(std, 2), nsmall = 2))

drel <- mean(alllenerror$perror[which(alllenerror$diam >= 20 & alllenerror$diam < 30)])
err[5,4] <- paste0(format(round(drel, 2), nsmall = 2), "%")

# class 30+
n <- length(alllenerror$diam[which(alllenerror$diam >= 30)])
err[6,2] <- n
m <- mean(alllenerror$error[which(alllenerror$diam >= 30)])
std <- stderr(alllenerror$error[which(alllenerror$diam >= 30)])
err[6,3] <- paste(format(round(m, 2), nsmall = 2), "+-", 
                  format(round(std, 2), nsmall = 2))

drel <- mean(alllenerror$perror[which(alllenerror$diam >= 30)])
err[6,4] <- paste0(format(round(drel, 2), nsmall = 2), "%")

len.error.table <- err

## now for length, to end ----

# make df with length errors
lenerror <- as.data.frame(abs(le$diam[which(is.na(le$error.date1) == FALSE &
                                              is.na(le$error.date2) == FALSE)]))
lenerror$error <- abs(le$error[which(is.na(le$error.date1) == FALSE &
                                       is.na(le$error.date2) == FALSE)])
lenerror$perror <- abs(le$perror[which(is.na(le$perror.date1) ==FALSE &
                                         is.na(le$error.date2) == FALSE)])
colnames(lenerror) <- c("diam", "error", "perror")


alllenerror <- lenerror



classes <- c("<3", "3-5", "5-10", "10-20", "20-30", ">30")
err <- as.data.frame(classes)
err$no <- NA
err$diam.abs <- NA
err$diam.rel <- NA

# class <3
n <- length(alllenerror$diam[which(alllenerror$diam < 3)])
err[1,2] <- n
m <- mean(alllenerror$error[which(alllenerror$diam < 3)])
std <- stderr(alllenerror$error[which(alllenerror$diam < 3)])
err[1,3] <- paste(format(round(m, 2), nsmall = 2), "+-", 
                  format(round(std, 2), nsmall = 2))

drel <- mean(alllenerror$perror[which(alllenerror$diam < 3)])
err[1,4] <- paste0(format(round(drel, 2), nsmall = 2), "%")

# class 3-5
n <- length(alllenerror$diam[which(alllenerror$diam >= 3 & alllenerror$diam < 5)])
err[2,2] <- n
m <- mean(alllenerror$error[which(alllenerror$diam >= 3 & alllenerror$diam < 5)])
std <- stderr(alllenerror$error[which(alllenerror$diam >= 3 & alllenerror$diam < 5)])
err[2,3] <- paste(format(round(m, 2), nsmall = 2), "+-", 
                  format(round(std, 2), nsmall = 2))

drel <- mean(alllenerror$perror[which(alllenerror$diam >= 3 & alllenerror$diam < 5)])
err[2,4] <- paste0(format(round(drel, 2), nsmall = 2), "%")


# class 5-10
n <- length(alllenerror$diam[which(alllenerror$diam >= 5 & alllenerror$diam < 10)])
err[3,2] <- n
m <- mean(alllenerror$error[which(alllenerror$diam >= 5 & alllenerror$diam < 10)])
std <- stderr(alllenerror$error[which(alllenerror$diam >= 5 & alllenerror$diam < 10)])
err[3,3] <- paste(format(round(m, 2), nsmall = 2), "+-", 
                  format(round(std, 2), nsmall = 2))

drel <- mean(alllenerror$perror[which(alllenerror$diam >= 5 & alllenerror$diam < 10)])
err[3,4] <- paste0(format(round(drel, 2), nsmall = 2), "%")

# class 10-20
n <- length(alllenerror$diam[which(alllenerror$diam >= 10 & alllenerror$diam < 20)])
err[4,2] <- n
m <- mean(alllenerror$error[which(alllenerror$diam >= 10 & alllenerror$diam < 20)])
std <- stderr(alllenerror$error[which(alllenerror$diam >= 10 & alllenerror$diam < 20)])
err[4,3] <- paste(format(round(m, 2), nsmall = 2), "+-", 
                  format(round(std, 2), nsmall = 2))

drel <- mean(alllenerror$perror[which(alllenerror$diam >= 10 & alllenerror$diam < 20)])
err[4,4] <- paste0(format(round(drel, 2), nsmall = 2), "%")


# class 20-30
n <- length(alllenerror$diam[which(alllenerror$diam >= 20 & alllenerror$diam < 30)])
err[5,2] <- n
m <- mean(alllenerror$error[which(alllenerror$diam >= 20 & alllenerror$diam < 30)])
std <- stderr(alllenerror$error[which(alllenerror$diam >= 20 & alllenerror$diam < 30)])
err[5,3] <- paste(format(round(m, 2), nsmall = 2), "+-", 
                  format(round(std, 2), nsmall = 2))

drel <- mean(alllenerror$perror[which(alllenerror$diam >= 20 & alllenerror$diam < 30)])
err[5,4] <- paste0(format(round(drel, 2), nsmall = 2), "%")

# class 30+
n <- length(alllenerror$diam[which(alllenerror$diam >= 30)])
err[6,2] <- n
m <- mean(alllenerror$error[which(alllenerror$diam >= 30)])
std <- stderr(alllenerror$error[which(alllenerror$diam >= 30)])
err[6,3] <- paste(format(round(m, 2), nsmall = 2), "+-", 
                  format(round(std, 2), nsmall = 2))

drel <- mean(alllenerror$perror[which(alllenerror$diam >= 30)])
err[6,4] <- paste0(format(round(drel, 2), nsmall = 2), "%")

lene.error.table <- err


## combine the tables ----

conerrors <- cbind(diam.error.table, len.error.table, lene.error.table)
conerrors <- conerrors[,-c(5,9)]
colnames(conerrors) <- c("Size Class", 
                         "Number measured", "Average difference (cm)",
                      "Relative difference",
                      "Number measured", "Average difference (cm)",
                      "Relative difference", 
                      "Number measured", "Average difference (cm)",
                      "Relative difference")


write.csv(conerrors, "../OUT/TABLE3.con.errors.by.size.class2.csv")
