# requires all.loc.data.date1, all.loc.data.date2, date1_centerpointdf, date2_centerpointdf

# add column to all.loc.data that indicates ground-level z value
all.loc.data.date1$ground.alt <- date1_centerpoint[3] 

# calculate distance from node to ground
all.loc.data.date1$vert.dist <- all.loc.data.date1$metersalt - all.loc.data.date1$ground.alt

# find distance from each node to centerpoint
center.dist <- function(centerpoint, nodes) {
  distances <- c(1:length(nodes[,1]))
  for (i in 1:length(nodes[,1])) {
    distance <- sqrt((centerpoint[1, 9] - nodes[i,10]) ^2 +
                       (centerpoint[1, 10] - nodes[i,11]) ^2 + 
                       (centerpoint[1, 11] - nodes[i,12]) ^2)
    distances[i] <- distance
    i <- i + 1
  }
  return(distances)
}

# calculate distance from node to centerpoint
all.loc.data.date1$center.dist <- center.dist(centerpoint = date1_centerpointdf, 
                                              nodes = all.loc.data.date1)


# find distance from point on ground to centerpoint
hor.dist <- function(centerpoint, nodes) {
  distances <- c(1:length(nodes[,1]))
  for (i in 1:length(nodes[,1])) {
    distance <- sqrt((centerpoint[1, 9] - nodes[i,10]) ^2 +
                       (centerpoint[1, 10] - nodes[i,11]) ^2 + 
                       (centerpoint[1, 11] - nodes[i,13]) ^2)
    distances[i] <- distance
    i <- i + 1
  }
  return(distances)
}

# calculate distance from node to centerpoint
all.loc.data.date1$hor.dist <- hor.dist(centerpoint = date1_centerpointdf, 
                                              nodes = all.loc.data.date1)
