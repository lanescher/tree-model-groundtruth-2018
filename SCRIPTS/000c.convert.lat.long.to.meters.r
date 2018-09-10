

# this script:
# 1. reads in location data
# 2. converts lat/long to meters
library(rgl)

# convert centerpoint to meters date1
date1_centerpointdf$reflat <- date1_centerpoint[2]
date1_centerpointdf$reflong <- date1_centerpoint[1]
date1_centerpointdf$rlat <- date1_centerpointdf$reflat * pi/180

# find meters per degree latitude at centerpoint
date1_centerpointdf$m.lat <- 111132.92 - 559.82 * 
  cos(2 * date1_centerpointdf$rlat) + 1.175 * 
  cos(4 * date1_centerpointdf$rlat)

# find meters per degree longitude at centerpoint
date1_centerpointdf$m.long <- 111412.84 * 
  cos(date1_centerpointdf$rlat) - 93.5 * 
  cos(3 * date1_centerpointdf$rlat)

date1_centerpointdf$meterslat <- date1_centerpointdf$Y_est * date1_centerpointdf$m.lat
date1_centerpointdf$meterslong <- date1_centerpointdf$X_est * date1_centerpointdf$m.long
date1_centerpointdf$metersalt <- date1_centerpointdf$Z_est

# convert centerpoint to meters date2
date2_centerpointdf$reflat <- date2_centerpoint[2]
date2_centerpointdf$reflong <- date2_centerpoint[1]
date2_centerpointdf$rlat <- date2_centerpointdf$reflat * pi/180

# find meters per degree latitude at centerpoint
date2_centerpointdf$m.lat <- 111132.92 - 559.82 * 
  cos(2 * date2_centerpointdf$rlat) + 1.175 * 
  cos(4 * date2_centerpointdf$rlat)

# find meters per degree longitude at centerpoint
date2_centerpointdf$m.long <- 111412.84 * 
  cos(date2_centerpointdf$rlat) - 93.5 * 
  cos(3 * date2_centerpointdf$rlat)

date2_centerpointdf$meterslat <- date2_centerpointdf$Y_est * date2_centerpointdf$m.lat
date2_centerpointdf$meterslong <- date2_centerpointdf$X_est * date2_centerpointdf$m.long
date2_centerpointdf$metersalt <- date2_centerpointdf$Z_est


# make empty df for ALL BRANCHES in date[1]
all.loc.data.date1 <- data.frame(Node = character(), 
                           X_est = numeric(), 
                           Y_est = numeric(), 
                           Z_est = numeric())

i <- 1
for (i in 1:length(branch)) {
  loc.data <- read.csv(paste("../DATA/INPUT/", tree, "_locations_", 
                           dates[1], "_branch", branch[i], ".txt", sep = ""),
                     skip = 1)
  loc.data <- loc.data[-c(1:14),-c(2:8)]
  all.loc.data.date1 <- rbind(all.loc.data.date1, loc.data)
  all.loc.data.date1$X.Label <- as.character(all.loc.data.date1$X.Label)
  i <- i + 1
}


all.loc.data.date1 <- all.loc.data.date1[rev(rownames(all.loc.data.date1)),]
all.loc.data.date1 <- all.loc.data.date1[!duplicated(all.loc.data.date1$X.Label),]

# make empty df for ALL BRANCHES in date[2]
all.loc.data.date2 <- data.frame(Node = character(), 
                                 X_est = numeric(), 
                                 Y_est = numeric(), 
                                 Z_est = numeric())
# loop that adds all location data to df for DATE 2

i <- 1
for (i in 1:length(branch)) {
  loc.data <- read.csv(paste("../DATA/INPUT/", tree, "_locations_", 
                             dates[2], "_branch", branch[i], ".txt", sep = ""),
                       skip = 1)
  loc.data <- loc.data[-c(1:14),-c(2:8)]
  all.loc.data.date2 <- rbind(all.loc.data.date2, loc.data)
  all.loc.data.date2$X.Label <- as.character(all.loc.data.date2$X.Label)
  i <- i + 1
}

all.loc.data.date2 <- all.loc.data.date2[rev(rownames(all.loc.data.date2)),]
all.loc.data.date2 <- all.loc.data.date2[!duplicated(all.loc.data.date2$X.Label),]


#### Only Date 1 right now

# use date1_centerpoint from 02.find.centerpoint script
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
# use date1_centerpoint from 03.findcenterpoint script
all.loc.data.date2$reflat <- date2_centerpoint[2]
all.loc.data.date2$reflong <- date2_centerpoint[1]
all.loc.data.date2$rlat <- all.loc.data.date2$reflat * pi/180

# find meters per degree latitude at centerpoint
all.loc.data.date2$m.lat <- 111132.92 - 559.82 * 
  cos(2 * all.loc.data.date2$rlat) + 1.175 * 
  cos(4 * all.loc.data.date2$rlat)

# find meters per degree longitude at centerpoint
all.loc.data.date2$m.long <- 111412.84 * 
  cos(all.loc.data.date2$rlat) - 93.5 * 
  cos(3 * all.loc.data.date2$rlat)

all.loc.data.date2$meterslat <- all.loc.data.date2$Y_est * all.loc.data.date2$m.lat
all.loc.data.date2$meterslong <- all.loc.data.date2$X_est * all.loc.data.date2$m.long
all.loc.data.date2$metersalt <- all.loc.data.date2$Z_est


