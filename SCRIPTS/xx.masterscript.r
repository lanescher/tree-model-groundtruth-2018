library(ggplot2)
library(ggpubr)
# master script


# read in and combine all data
# this is where you add tree info
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

# make graphs for accuracy
source("../SCRIPTS/08a.accuracy.analysis.r")

# make accuracy table
source("../SCRIPTS/08b.make.accuracy.table.r")

# make graphs for consistency
source("../SCRIPTS/09a.consistency.analysis.r")

# make consistency table
source("../SCRIPTS/09b.make.consistency.table.r")

# weather analysis
source("../SCRIPTS/10.weather.conditions.analysis.r")
