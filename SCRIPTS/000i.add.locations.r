#08b. add location

# read in location data
#source("../SCRIPTS/07.location.data.r")

# merge with location data
loc.data$node <- gsub("[.]", "*", loc.data$node)
loc.data$node <- gsub("[-]", ".", loc.data$node)

all.data <- merge(loc.data, all.measure, by = "node")

all.data$is.in.y <- NULL
all.data$random <- NULL
