# read in centerpointdata and find center point

dates <- c("171221", "180109")

date1_center <- read.csv(paste("C:/Users/lscher/Documents/Tree Observatory/3D model analysis/data/centerpointdata/memorialoak_", dates[1], "_center_GPS.txt",
                               sep = ""),
                              skip = 1)

date1_center.x <- date1_center$X_est
date1_center.y <- date1_center$Y_est
date1_center.z <- date1_center$Z_est

date1_center.new <- as.data.frame(date1_center.x)
date1_center.new$Y_est <- date1_center.y
date1_center.new$Z_est <- date1_center.z
names(date1_center.new) <- c("X_est", "Y_est", "Z_est")
date1_center.new <- date1_center.new[17:21,]
date1_center.new <- date1_center.new[-2,]

# calculate L, M, N
dirnum1 <- date1_center.new[1,] - date1_center.new[2,]
dirnum2 <- date1_center.new[3,] - date1_center.new[4,]


# calculate x
x <- (date1_center.new[1,1] * as.numeric(dirnum2[1]) - 
        date1_center.new[3,1] * as.numeric(dirnum1[1])) / 
  (as.numeric(dirnum2[1]) - as.numeric(dirnum1[1]))

# calculate y
y <- (date1_center.new[1,2] * as.numeric(dirnum2[2]) - 
        date1_center.new[3,2] * as.numeric(dirnum1[2])) / 
  (as.numeric(dirnum2[2]) - as.numeric(dirnum1[2]))

# calculate Z
z <- (date1_center.new[1,3] * as.numeric(dirnum2[3]) - 
        date1_center.new[3,3] * as.numeric(dirnum1[3])) / 
  (as.numeric(dirnum2[3]) - as.numeric(dirnum1[3]))

date1_centerpoint <- c(x, y, z)
date1_center.new[5,] <- date1_centerpoint

#### Repeat for date2
