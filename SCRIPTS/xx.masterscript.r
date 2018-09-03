library(ggplot2)
# master script

# find corresponding nodes in the two models
# Produces csv files. Results are not used for subsequent analysis
# source("../SCRIPTS/01.read.and.merge.node.lists.r")


# read in and combine all data
source("../SCRIPTS/001.combine.all.data.r")

# count measurements
source("../SCRIPTS/14.count.measurements.r")

# define error functions
source("../SCRIPTS/10.define.error.functions.r")

# calculate model consistency
source("../SCRIPTS/11.model.consistency.r")

# calculate error between model and real
source("../SCRIPTS/12.calculate.model.real.error.r")

# compare models to real
source("../SCRIPTS/13.model.vs.real.analysis.r")

# make graphs
source("../SCRIPTS/200.graphs.for.presentation.r")