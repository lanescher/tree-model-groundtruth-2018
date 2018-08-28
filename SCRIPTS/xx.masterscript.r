
# master script

# find corresponding nodes in the two models
# Produces csv files. Results are not used for subsequent analysis
# source("../SCRIPTS/01.read.and.merge.node.lists.r")

# read in centerpoint data and find centerpoint
source("../SCRIPTS/02.find.centerpoint.r")

# read in and combine all data
source("../SCRIPTS/001.combine.all.data.r")

# define error functions
source("../SCRIPTS/10.define.error.functions.r")

