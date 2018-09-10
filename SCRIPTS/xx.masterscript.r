library(ggplot2)
library(ggpubr)
# master script

# find corresponding nodes in the two models
# Produces csv files. Results are not used for subsequent analysis
# source("../SCRIPTS/01.read.and.merge.node.lists.r")


# read in and combine all data
source("../SCRIPTS/001.combine.all.data.r")

# count measurements
source("../SCRIPTS/14.count.measurements.r")

# add tree branch column
source("../SCRIPTS/15.add.tree.branch.column.r")

# define error functions
source("../SCRIPTS/10.define.error.functions.r")

# calculate error between model and real
source("../SCRIPTS/12.calculate.model.real.error.r")

# calculate error between two models
source("../SCRIPTS/11a.calculate.model.consistency.r")

# subset data
source("../SCRIPTS/16.subset.data.r")

# find measurements with large errors
source("../SCRIPTS/18.find.measurements.with.large.error.r")




# make graphs
source("../SCRIPTS/200.graphs.for.presentation.r")

# compare models to real ## maybe don't need this here?
source("../SCRIPTS/13.model.vs.real.analysis.r")

# calculate model consistency
source("../SCRIPTS/11.model.consistency.r")