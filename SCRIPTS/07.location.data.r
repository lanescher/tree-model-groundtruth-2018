# run all scripts to produce node location data and photo location data.
# write one file with node location data and one file with photo location data.


# source file to find centerpoint in both dates
source("SCRIPTS/02.find.centerpoint.r")

# source file to convert centerpoint and nodes to lat/long
source("SCRIPTS/03.convert.lat.long.to.meters.r")

# source file to find distances from nodes to centerpoint
source("SCRIPTS/04.find.node.distances.r")

# source file to find theta between centerpoint and nodes
source("SCRIPTS/05.find.node.theta.r")


# enter tree, branch, and date info
branches <- c(branches, branches2)



# merge data, make new columns with differences
all.loc.data <- merge(all.loc.data.date1, all.loc.data.date2, all = TRUE, by = "X.Label")

# add column specifying which model each node is in
all.loc.data$is.in <- "both"
all.loc.data$is.in[which(is.na(all.loc.data$X_est.x) == TRUE)] <- "180109"
all.loc.data$is.in[which(is.na(all.loc.data$X_est.y) == TRUE)] <- "171221"

# add columns with avgs and differences between two models
# avg hor dist
all.loc.data$avg.hor.dist <- NA
all.loc.data$avg.hor.dist[which(all.loc.data$is.in == "both")] <- 
  (all.loc.data$hor.dist.x[which(all.loc.data$is.in == "both")] + 
  all.loc.data$hor.dist.y[which(all.loc.data$is.in == "both")]) / 2

# diff hor dist
all.loc.data$diff.hor.dist <- NA
all.loc.data$diff.hor.dist[which(all.loc.data$is.in == "both")] <- 
  all.loc.data$hor.dist.x[which(all.loc.data$is.in == "both")] - 
  all.loc.data$hor.dist.y[which(all.loc.data$is.in == "both")]

# avg vert dist
all.loc.data$avg.vert.dist <- NA
all.loc.data$avg.vert.dist[which(all.loc.data$is.in == "both")] <- 
  (all.loc.data$vert.dist.x[which(all.loc.data$is.in == "both")] + 
     all.loc.data$vert.dist.y[which(all.loc.data$is.in == "both")]) / 2

# diff vert dist
all.loc.data$diff.vert.dist <- NA
all.loc.data$diff.vert.dist[which(all.loc.data$is.in == "both")] <- 
  all.loc.data$vert.dist.x[which(all.loc.data$is.in == "both")] - 
  all.loc.data$vert.dist.y[which(all.loc.data$is.in == "both")]

# avg center dist
all.loc.data$avg.center.dist <- NA
all.loc.data$avg.center.dist[which(all.loc.data$is.in == "both")] <- 
  (all.loc.data$center.dist.x[which(all.loc.data$is.in == "both")] + 
     all.loc.data$center.dist.y[which(all.loc.data$is.in == "both")]) / 2

# diff center dist
all.loc.data$diff.center.dist <- NA
all.loc.data$diff.center.dist[which(all.loc.data$is.in == "both")] <- 
  all.loc.data$center.dist.x[which(all.loc.data$is.in == "both")] - 
  all.loc.data$center.dist.y[which(all.loc.data$is.in == "both")]

# avg theta
all.loc.data$avg.theta <- NA
all.loc.data$avg.theta[which(all.loc.data$is.in == "both")] <- 
  (all.loc.data$thetadeg.x[which(all.loc.data$is.in == "both")] + 
     all.loc.data$thetadeg.y[which(all.loc.data$is.in == "both")]) / 2

# diff theta 
all.loc.data$diff.theta <- NA
all.loc.data$diff.theta[which(all.loc.data$is.in == "both")] <- 
  all.loc.data$thetadeg.x[which(all.loc.data$is.in == "both")] - 
  all.loc.data$thetadeg.y[which(all.loc.data$is.in == "both")]


# write file with raw merged data
write.csv(all.loc.data, paste("DATA/OUTPUT/", tree, "_node_locations_RAW.csv", sep = ""))


# create new df with location avgs - this will only put values for nodes in both models
loc.data <- as.data.frame(all.loc.data$X.Label)
names(loc.data) <- "node"
loc.data$is.in <- all.loc.data$is.in
loc.data$vert.dist <- all.loc.data$avg.vert.dist
loc.data$center.dist <- all.loc.data$avg.center.dist
loc.data$hor.dist <- all.loc.data$avg.hor.dist
loc.data$theta <- all.loc.data$avg.theta

# fill in locations for nodes that are only in one model
loc.data$vert.dist[which(loc.data$is.in == "171221")] <- all.loc.data$vert.dist.x[which(loc.data$is.in == "171221")]
loc.data$center.dist[which(loc.data$is.in == "171221")] <- all.loc.data$center.dist.x[which(loc.data$is.in == "171221")]
loc.data$hor.dist[which(loc.data$is.in == "171221")] <- all.loc.data$hor.dist.x[which(loc.data$is.in == "171221")]
loc.data$theta[which(loc.data$is.in == "171221")] <- all.loc.data$thetadeg.x[which(loc.data$is.in == "171221")]

loc.data$vert.dist[which(loc.data$is.in == "180109")] <- all.loc.data$vert.dist.y[which(loc.data$is.in == "180109")]
loc.data$center.dist[which(loc.data$is.in == "180109")] <- all.loc.data$center.dist.y[which(loc.data$is.in == "180109")]
loc.data$hor.dist[which(loc.data$is.in == "180109")] <- all.loc.data$hor.dist.y[which(loc.data$is.in == "180109")]
loc.data$theta[which(loc.data$is.in == "180109")] <- all.loc.data$thetadeg.y[which(loc.data$is.in == "180109")]

# write file with averaged loc data
write.csv(loc.data, paste("DATA/OUTPUT/", tree, "_node_locations.csv", sep = ""))
