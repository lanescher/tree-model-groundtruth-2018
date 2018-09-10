

# find corresponding nodes in the two models
# Produces csv files. Results are not used for subsequent analysis
# source("../SCRIPTS/000a.read.and.merge.node.lists.r")

# read in centerpoint data and find centerpoint
source("../SCRIPTS/000b.find.centerpoint.r")

# convert lat and long to meters
source("../SCRIPTS/000c.convert.lat.long.to.meters.r")

# find distance from nodes to center, ground, and centerpoints
source("../SCRIPTS/000d.find.node.distances.r")

# find angle of node
source("../SCRIPTS/000e.find.node.theta.r")

# combine location data for each model, find averages
source("../SCRIPTS/000f.location.data.r")

# read in measurements from models
source("../SCRIPTS/000g.read.in.model.measurements.r")

# read in measurements from real
source("../SCRIPTS/000h.read.in.real.measurements.r")

# add locations to measurements
source("../SCRIPTS/000i.add.locations.r")

# combine data and reshape
source("../SCRIPTS/000j.reshape.data.with.real.r")

