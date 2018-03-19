# read in measurements

tree <- "memorialoak"
branches <- c("01", "08", "09", "10", "13")
dates <- c("171221", "180109")

all.measure <- data.frame(node = factor(),
                                 is.in = character(),
                                 random = numeric(),
                                 main.nodeto = factor(),
                                 branch.nodeto = factor(),
                                 maindiameter.date1 = numeric(),
                                 mainlength.date1 = numeric(),
                                 branchdiameter.date1 = numeric(),
                                 branchlength.date1 = numeric(),
                                 maindiameter.date2 = numeric(),
                                 mainlength.date2 = numeric(),
                                 branchdiameter.date2 = numeric(),
                                 branchlength.date2 = numeric())

i <- 1
for (i in 1:length(branches)) {
  meas <- read.csv(paste("DATA/INPUT/branch selection_", tree, " - primary", 
                             branches[i], ".csv", sep = ""),
                   col.names = c("node", "is.in", "random", "main.nodeto", "branch.nodeto", 
                                 "maindiameter.date1", "mainlength.date1",
                                 "branchdiameter.date1", "branchlength.date1",
                                 "maindiameter.date2", "mainlength.date2",
                                 "branchdiameter.date2", "branchlength.date2"))
  all.measure <- rbind(all.measure, meas)
  i <- i + 1
}

loc.data$node <- gsub("[.]", "*", loc.data$node)
loc.data$node <- gsub("[-]", ".", loc.data$node)

# merge with location data
all.data <- merge(loc.data, all.measure, by = "node")

all.data$is.in.y <- NULL
all.data$random <- NULL

