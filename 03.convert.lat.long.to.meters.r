# this script:
# 1. reads in location data
# 2. converts lat/long to meters
library(rgl)


dates <- c("171221", "180109")
branches <- c("01", "08", "09", "10", "13")

# make empty df for ALL BRANCHES in date[1]
all.loc.data.date1 <- data.frame(Node = character(), 
                           X_est = numeric(), 
                           Y_est = numeric(), 
                           Z_est = numeric())

# loop that adds all location data to df for date[1]
i <- 1
for (i in 1:length(branches)) {
  loc.data <- read.csv(paste("C:/Users/lscher/Documents/Tree Observatory/3D model analysis/data/branchdata/", 
                           dates[1], "_branch", branches[i], ".txt", sep = ""),
                     skip = 1)
  loc.data <- loc.data[-c(1:14),-c(2:8)]
  all.loc.data.date1 <- rbind(all.loc.data.date1, loc.data)
  i <- i + 1
}

# make empty df for ALL BRANCHES in date[2]
all.loc.data.date2 <- data.frame(Node = character(), 
                                 X_est = numeric(), 
                                 Y_est = numeric(), 
                                 Z_est = numeric())
# loop that adds all location data to df for DATE 2
i <- 1
for (i in 1:length(branches)) {
  loc.data <- read.csv(paste("C:/Users/lscher/Documents/Tree Observatory/3D model analysis/data/branchdata/", 
                             dates[2], "_branch", branches[i], ".txt", sep = ""),
                       skip = 1)
  loc.data <- loc.data[-c(1:14),-c(2:8)]
  all.loc.data.date2 <- rbind(all.loc.data.date2, loc.data)
  i <- i + 1
}

#### Only Branch 1 right now

# use date1_centerpoint from 03.findcenterpoint script
all.loc.data.date1$reflat <- date1_centerpoint[2]
all.loc.data.date1$reflong <- date1_centerpoint[1]
all.loc.data.date1$rlat <- all.loc.data.date1$reflat * pi/180

# find meters per degree latitude at centerpoint
all.loc.data.date1$m.lat <- 111132.92 - 559.82 * 
  cos(2 * all.loc.data.date1$rlat) + 1.175 * 
  cos(4 * all.loc.data.date1$rlat)

# find meters per degree longitude at centerpoint
all.loc.data.date1$m.long <- 111412.84 * 
  cos(all.loc.data.date1$rlat) - 93.5 * 
  cos(3 * all.loc.data.date1$rlat)

all.loc.data.date1$meterslat <- all.loc.data.date1$Y_est * all.loc.data.date1$m.lat
all.loc.data.date1$meterslong <- all.loc.data.date1$X_est * all.loc.data.date1$m.long
all.loc.data.date1$metersalt <- all.loc.data.date1$Z_est



#### REPEAT FOR DATE2



### Repeat for targets

nodes.m.17 <- read.csv("C:/Users/lscher/Documents/Tree Observatory/3D model analysis/data/branchdata/171221_branch01_GPS.txt",
                       skip = 1)
targets <- nodes.m.17[-c(15:54),9:11]
targets$reflat <- date1_centerpoint[2]
targets$reflong <- date1_centerpoint[1]
targets$rlat <- targets$reflat * pi / 180

targets$m.lat <- 111132.92 - 559.82 * 
  cos(2 * targets$rlat) + 1.175 * 
  cos(4 * targets$rlat)

targets$m.long <- 111412.84 * 
  cos(targets$rlat) - 93.5 * 
  cos(3 * targets$rlat)

targets$meterslat <- targets$Y_est * targets$m.lat
targets$meterslong <- targets$X_est * targets$m.long
targets$metersalt <- targets$Z_est



# plot all points date 1
plot3d(x = targets$meterslong, y = targets$meterslat, z = targets$metersalt, col = "green")
aspect3d(x = "iso")
points3d(x = all.loc.data.date1$meterslong, 
       y = all.loc.data.date1$meterslat, 
       z = all.loc.data.date1$metersalt)

# plot all points date 2

