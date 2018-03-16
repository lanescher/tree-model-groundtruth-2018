# run all scripts to produce node location data and photo location data.
# write one file with node location data and one file with photo location data.

# set wd
setwd("C:/Users/lscher/Documents/Github/tree-model-groundtruth-2018")

# enter tree, branch, and date info
tree <- "memorialoak"
branches <- c("01", "08", "09", "10", "13")
dates <- c("171221", "180109")


# source file to find centerpoint in both dates
source("SCRIPTS/02.find.centerpoint.r")

# source file to convert centerpoint and nodes to lat/long
source("SCRIPTS/03.convert.lat.long.to.meters.r")

# source file to find distances from nodes to centerpoint
source("SCRIPTS/04.find.node.distances.r")

# source file to find theta between centerpoint and nodes
source("SCRIPTS/05.find.node.theta.r")

# merge data, make new columns with differences
all.loc.data <- merge(all.loc.data.date1, all.loc.data.date2, all.x = TRUE, by = "X.Label")
all.loc.data$diff.hor.dist <- all.loc.data$hor.dist.x - all.loc.data$hor.dist.y
all.loc.data$diff.vert.dist <- all.loc.data$vert.dist.x - all.loc.data$vert.dist.y
all.loc.data$diff.center.dist <- all.loc.data$center.dist.x - all.loc.data$center.dist.y
all.loc.data$diff.theta <- all.loc.data$thetadeg.x - all.loc.data$thetadeg.y

# write file with raw merged data
write.csv(all.loc.data, paste("DATA/OUTPUT/", tree, "_node_locations.csv", sep = ""))

# create new df with location avgs
loc.data <- as.data.frame(all.loc.data$X.Label)
names(loc.data) <- "node"
loc.data$vert.dist <- (all.loc.data$vert.dist.x + all.loc.data$vert.dist.y)/2
loc.data$center.dist <- (all.loc.data$center.dist.x + all.loc.data$center.dist.y)/2
loc.data$hor.dist <- (all.loc.data$hor.dist.x + all.loc.data$hor.dist.y)/2
loc.data$theta <- (all.loc.data$thetadeg.x + all.loc.data$thetadeg.y)/2
