# read in centerpointdata and find center point

# find centerpoint for date 1
date1_center <- read.csv(paste("../DATA/INPUT/", tree,"_locations_", dates[1], "_center.txt",
                               sep = ""),
                              skip = 1)

date1_center.x <- date1_center$X_est
date1_center.y <- date1_center$Y_est
date1_center.z <- date1_center$Z_est

date1_center.new <- as.data.frame(date1_center.x)
date1_center.new$Y_est <- date1_center.y
date1_center.new$Z_est <- date1_center.z
names(date1_center.new) <- c("X_est", "Y_est", "Z_est")
date1_center.new <- date1_center.new[-c(1:14),]

# calculate L, M, N
dirnum1 <- date1_center.new[1,] - date1_center.new[3,]
dirnum2 <- date1_center.new[2,] - date1_center.new[4,]


# calculate x
x <- (date1_center.new[1,1] * as.numeric(dirnum2[1]) - 
        date1_center.new[2,1] * as.numeric(dirnum1[1])) / 
  (as.numeric(dirnum2[1]) - as.numeric(dirnum1[1]))

# calculate y
y <- (date1_center.new[1,2] * as.numeric(dirnum2[2]) - 
        date1_center.new[2,2] * as.numeric(dirnum1[2])) / 
  (as.numeric(dirnum2[2]) - as.numeric(dirnum1[2]))

# calculate Z
z <- (date1_center.new[1,3] * as.numeric(dirnum2[3]) - 
        date1_center.new[2,3] * as.numeric(dirnum1[3])) / 
  (as.numeric(dirnum2[3]) - as.numeric(dirnum1[3]))

date1_centerpoint <- c(x, y, z)
date1_center.new[5,] <- date1_centerpoint

date1_centerpointdf <- as.data.frame(date1_center.new[5,])


# find centerpoint for date 2
date2_center <- read.csv(paste("../DATA/INPUT/", tree, "_locations_", dates[2], "_center.txt",
                               sep = ""),
                         skip = 1)

date2_center.x <- date2_center$X_est
date2_center.y <- date2_center$Y_est
date2_center.z <- date2_center$Z_est

date2_center.new <- as.data.frame(date2_center.x)
date2_center.new$Y_est <- date2_center.y
date2_center.new$Z_est <- date2_center.z
names(date2_center.new) <- c("X_est", "Y_est", "Z_est")
date2_center.new <- date2_center.new[-c(1:14),]


# calculate L, M, N
dirnum1 <- date2_center.new[1,] - date2_center.new[3,]
dirnum2 <- date2_center.new[2,] - date2_center.new[4,]


# calculate x
x <- (date2_center.new[1,1] * as.numeric(dirnum2[1]) - 
        date2_center.new[2,1] * as.numeric(dirnum1[1])) / 
  (as.numeric(dirnum2[1]) - as.numeric(dirnum1[1]))

# calculate y
y <- (date2_center.new[1,2] * as.numeric(dirnum2[2]) - 
        date2_center.new[2,2] * as.numeric(dirnum1[2])) / 
  (as.numeric(dirnum2[2]) - as.numeric(dirnum1[2]))

# calculate Z
z <- (date2_center.new[1,3] * as.numeric(dirnum2[3]) - 
        date2_center.new[2,3] * as.numeric(dirnum1[3])) / 
  (as.numeric(dirnum2[3]) - as.numeric(dirnum1[3]))

date2_centerpoint <- c(x, y, z)
date2_center.new[5,] <- date2_centerpoint

date2_centerpointdf <- as.data.frame(date2_center.new[5,])
