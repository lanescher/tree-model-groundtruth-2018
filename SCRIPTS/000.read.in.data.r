

# find corresponding nodes in the two models
# Produces csv files. Results are not used for subsequent analysis
# source("../SCRIPTS/01.read.and.merge.node.lists.r")

# read in centerpoint data and find centerpoint
source("../SCRIPTS/02.find.centerpoint.r")

# convert lat and long to meters
source("../SCRIPTS/03.convert.lat.long.to.meters.r")

# find distance from nodes to center, ground, and centerpoints
source("../SCRIPTS/04.find.node.distances.r")

# find angle of node
source("../SCRIPTS/05.find.node.theta.r")

# combine location data for each model, find averages
source("../SCRIPTS/07.location.data.r")

# read in measurements from models
source("../SCRIPTS/08.read.in.model.measurements.r")

# read in measurements from real
source("../SCRIPTS/08a.read.in.real.measurements.r")

# add locations to measurements
source("../SCRIPTS/08b.add.locations.r")

# combine data and reshape
source("../SCRIPTS/09.reshape.data.with.real.r")

