# this script finds horizontal distance between photos and centerpoint
# also finds max, min, and average for both inner and outter orbits

tree <- "memorialoak"
dates <- c("171221", "180109")


### DATE 1
# read in photo data
date1photos <- read.csv(paste("DATA/INPUT/", tree,"_", dates[1], "_photos.txt",
                                              sep = ""),
                                        skip = 1)

date1photos <- date1photos[,-c(2:15)]
date1photos <- date1photos[,-c(5:7)]


# convert to meters
date1photos$reflat <- date1_centerpoint[2]
date1photos$reflong <- date1_centerpoint[1]
date1photos$rlat <- date1photos$reflat * pi/180

# find meters per degree latitude at centerpoint
date1photos$m.lat <- 111132.92 - 559.82 * 
  cos(2 * date1photos$rlat) + 1.175 * 
  cos(4 * date1photos$rlat)

# find meters per degree longitude at centerpoint
date1photos$m.long <- 111412.84 * 
  cos(date1photos$rlat) - 93.5 * 
  cos(3 * date1photos$rlat)

date1photos$meterslat <- date1photos$Y_est * date1photos$m.lat
date1photos$meterslong <- date1photos$X_est * date1photos$m.long
date1photos$metersalt <- date1_centerpointdf$metersalt

# find hor.dist
date1photos$hor.dist <- hor.dist(date1_centerpointdf, date1photos)

# find vert.dist
date1photos$vert.dist <- date1photos$Z_est - date1photos$metersalt


### DATE 2
# read in photo data
date2photos <- read.csv(paste("DATA/INPUT/", tree,"_", dates[2], "_photos.txt",
                              sep = ""),
                        skip = 1)

date2photos <- date2photos[,-c(2:15)]
date2photos <- date2photos[,-c(5:7)]


# convert to meters
date2photos$reflat <- date2_centerpoint[2]
date2photos$reflong <- date2_centerpoint[1]
date2photos$rlat <- date2photos$reflat * pi/180

# find meters per degree latitude at centerpoint
date2photos$m.lat <- 111132.92 - 559.82 * 
  cos(2 * date2photos$rlat) + 1.175 * 
  cos(4 * date2photos$rlat)

# find meters per degree longitude at centerpoint
date2photos$m.long <- 111412.84 * 
  cos(date2photos$rlat) - 93.5 * 
  cos(3 * date2photos$rlat)

date2photos$meterslat <- date2photos$Y_est * date2photos$m.lat
date2photos$meterslong <- date2photos$X_est * date2photos$m.long
date2photos$metersalt <- date2_centerpointdf$metersalt

# find hor.dist
date2photos$hor.dist <- hor.dist(date2_centerpointdf, date2photos)

# find vert.dist
date2photos$vert.dist <- date2photos$Z_est - date2photos$metersalt

