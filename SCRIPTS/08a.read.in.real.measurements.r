#08a. Read in real measurements


# read in real data

real.measure <- data.frame(node = factor(),
                           main.nodeto = factor(),
                           branch.nodeto = factor(),
                           maindiameter.real = numeric(),
                           maindiameterbroken.real = factor(),
                           mainlength.real = numeric(),
                           mainlengthbroken.real = factor(),
                           branchdiameter.real = numeric(),
                           branchdiameterbroken.real = factor(),
                           branchlength.real = numeric(),
                           branchlengthbroken.real = factor())

i <- 1
for (i in 1:length(branches)) {
  meas <- read.csv(paste("DATA/INPUT/", tree, "_real_branch",
                        branches[i], ".csv", sep = ""), skip = 3,
                   col.names = c("node", "main.nodeto",
                                 "maindiameter.real", "maindiameterbroken.real",
                                 "mainlength.real", "mainlengthbroken.real",
                                 "branch.nodeto",
                                 "branchdiameter.real", "branchdiameterbroken.real",
                                 "branchlength.real", "branchlengthbroken.real"))
  real.measure <- rbind(real.measure, meas)
  i <- i + 1
}


# merge real with model measurements
all.measure <- merge(all.measure, real.measure, all = TRUE)
