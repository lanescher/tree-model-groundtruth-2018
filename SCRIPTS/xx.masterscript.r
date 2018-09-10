library(ggplot2)
library(ggpubr)
# master script

# find corresponding nodes in the two models
# Produces csv files. Results are not used for subsequent analysis
# source("../SCRIPTS/01.read.and.merge.node.lists.r")


# read in and combine all data
source("../SCRIPTS/01.combine.all.data.r")

# count measurements
source("../SCRIPTS/02.count.measurements.r")

# add tree branch column
source("../SCRIPTS/03.add.tree.branch.column.r")

# define error functions
source("../SCRIPTS/04.define.error.functions.r")

# calculate error between model and real
source("../SCRIPTS/05.calculate.model.real.error.r")

# calculate error between two models
source("../SCRIPTS/06.calculate.model.consistency.r")

# subset data
source("../SCRIPTS/07.subset.data.r")

# find measurements with large errors
source("../SCRIPTS/08.find.measurements.with.large.error.r")


