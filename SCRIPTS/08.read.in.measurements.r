# read in measurements

setwd("/Users/lanescher/Documents/GitHub/tree-model-groundtruth-2018")

tree <- "memorialoak"
branches <- c("01")
branches2 <- c("03")
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
for (i in 1:length(branches2)) {
  meas <- read.csv(paste("DATA/INPUT/branch selection_", tree, " - primary", 
                         branches2[i], ".csv", sep = ""),
                   col.names = c("node", "is.in", "random", "main.nodeto", "branch.nodeto", 
                                 "maindiameter.date1", "mainlength.date1",
                                 "branchdiameter.date1", "branchlength.date1",
                                 "maindiameter.date2", "mainlength.date2",
                                 "branchdiameter.date2", "branchlength.date2"))
  all.measure <- rbind(all.measure, meas)
  i <- i + 1
}

all.measure$node <- gsub("[.]", "*", all.measure$node)
all.measure$node <- gsub("[-]", ".", all.measure$node)

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


# read in real data

real.measure <- data.frame(node = factor(),
                           main.nodeto = factor(),
                           branch.nodeto = factor(),
                           maindiameter.real = numeric(),
                           mainlength.real = numeric(),
                           mainbroken.real = factor(),
                           branchdiameter.real = numeric(),
                           branchlength.real = numeric(),
                           branchbroken.real = factor())

i <- 1
for (i in 1:length(branches2)) {
  meas <- read.csv(paste("DATA/INPUT/", tree, "_real_branch", 
                         branches2[i], ".csv", sep = ""),
                   col.names = c("node", "main.nodeto", "branch.nodeto", 
                                 "maindiameter.real", "mainlength.real",
                                 "mainbroken.real",
                                 "branchdiameter.real", "branchlength.real",
                                 "branchbroken.real"))
  real.measure <- rbind(real.measure, meas)
  i <- i + 1
}

real.measure$node <- gsub("[.]", "*", real.measure$node)
real.measure$node <- gsub("[-]", ".", real.measure$node)

i <- 1
for (i in 1:length(branches)) {
  meas <- read.csv(paste("DATA/INPUT/", tree, "_real_branch", 
                         branches[i], ".csv", sep = ""),
                   col.names = c("node", "main.nodeto", "branch.nodeto", 
                                 "maindiameter.real", "mainlength.real",
                                 "mainbroken.real",
                                 "branchdiameter.real", "branchlength.real",
                                 "branchbroken.real"))
  real.measure <- rbind(real.measure, meas)
  i <- i + 1
}


# merge real with model measurements
all.measure <- merge(all.measure, real.measure, all = TRUE)
 

# merge with location data
loc.data$node <- gsub("[.]", "*", loc.data$node)
loc.data$node <- gsub("[-]", ".", loc.data$node)

all.data <- merge(loc.data, all.measure, by = "node")

all.data$is.in.y <- NULL
all.data$random <- NULL

all.data <- all.measure
