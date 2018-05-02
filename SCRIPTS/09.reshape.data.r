# reshape measurement data

library(reshape2)

# read in all data
source("SCRIPTS/08.read.in.measurements.r")

all.data <- melt(all.data, id.vars = c("node", "is.in.x", 
                                   "vert.dist", "center.dist", "hor.dist", "theta", 
                                   "main.nodeto", "branch.nodeto"))

# add column for date
all.data$date <- NA
all.data$date[which(all.data$variable == "maindiameter.date1" | 
                      all.data$variable == "mainlength.date1" |
                      all.data$variable == "branchdiameter.date1" |
                      all.data$variable == "branchlength.date1")] <- "date1"
all.data$date[which(all.data$variable == "maindiameter.date2" | 
                           all.data$variable == "mainlength.date2" |
                           all.data$variable == "branchdiameter.date2" |
                           all.data$variable == "branchlength.date2")] <- "date2"
all.data$date[which(all.data$variable == "maindiameter.real" | 
                      all.data$variable == "mainlength.real" |
                      all.data$variable == "branchdiameter.real" |
                      all.data$variable == "branchlength.real" |
                      all.data$variable == "maindiameterbroken.real" |
                      all.data$variable == "mainlengthbroken.real" |
                      all.data$variable == "branchdiameterbroken.real" |
                      all.data$variable == "branchlengthbroken.real")] <- "real"


# add column for branch
all.data$branch <- NA
all.data$branch[which(all.data$variable == "maindiameter.date1" | 
                             all.data$variable == "mainlength.date1" |
                             all.data$variable == "maindiameter.date2" |
                             all.data$variable == "mainlength.date2" |
                             all.data$variable == "maindiameter.real" |
                             all.data$variable == "mainlength.real" |
                             all.data$variable == "mainlengthbroken.real" |
                             all.data$variable == "maindiameterbroken.real")] <- "main"
all.data$branch[which(all.data$variable == "branchdiameter.date1" | 
                             all.data$variable == "branchlength.date1" |
                             all.data$variable == "branchdiameter.date2" |
                             all.data$variable == "branchlength.date2" |
                             all.data$variable == "branchdiameter.real" |
                             all.data$variable == "branchlength.real"|
                             all.data$variable == "branchlengthbroken.real" |
                             all.data$variable == "branchdiameterbroken.real")] <- "branch"

# add column for measurement
all.data$measurement <- NA
all.data$measurement[which(all.data$variable == "maindiameter.date1" | 
                                  all.data$variable == "branchdiameter.date1" |
                                  all.data$variable == "maindiameter.date2" |
                                  all.data$variable == "branchdiameter.date2" |
                                  all.data$variable == "maindiameter.real" |
                                  all.data$variable == "branchdiameter.real" |
                                  all.data$variable == "maindiameterbroken.real" |
                                  all.data$variable == "branchdiameterbroken.real")] <- "diameter"
all.data$measurement[which(all.data$variable == "mainlength.date1" | 
                                  all.data$variable == "branchlength.date1" |
                                  all.data$variable == "mainlength.date2" |
                                  all.data$variable == "branchlength.date2" |
                                  all.data$variable == "mainlength.real" |
                                  all.data$variable == "branchlength.real"|
                                  all.data$variable == "mainlengthbroken.real" |
                                  all.data$variable == "branchlengthbroken.real")] <- "length"

# add column for endpoint
all.data$endpoint <- "branch"
all.data$endpoint[which(all.data$branch == "main" & 
                               all.data$main.nodeto == "end")] <- "end"
all.data$endpoint[which(all.data$branch == "branch" & 
                               all.data$branch.nodeto == "end")] <- "end"



date1data <- all.data[which(all.data$date == "date1"),]
date2data <- all.data[which(all.data$date == "date2"),]
realdata <- all.data[which(all.data$date == "real"),]
real <- realdata[which(realdata$variable != "maindiameterbroken.real" & 
                         realdata$variable != "mainlengthbroken.real" &
                         realdata$variable != "branchdiameterbroken.real" &
                         realdata$variable != "branchlengthbroken.real"),]
realbroken <- realdata[which(realdata$variable == "maindiameterbroken.real" | 
                         realdata$variable == "mainlengthbroken.real" |
                         realdata$variable == "branchdiameterbroken.real" |
                         realdata$variable == "branchlengthbroken.real"),]

all.data <- merge(date1data, date2data, by = c("node", "branch", "measurement", "endpoint",
                                               "is.in.x", "vert.dist", "center.dist", "hor.dist",
                                               "theta", "main.nodeto", "branch.nodeto"))

all.data <- merge(all.data, real, by = c("node", "branch", "measurement", "endpoint",
                                               "is.in.x", "vert.dist", "center.dist", "hor.dist",
                                               "theta", "main.nodeto", "branch.nodeto"))

all.data <- merge(all.data, realbroken, by = c("node", "branch", "measurement", "endpoint",
                                         "is.in.x", "vert.dist", "center.dist", "hor.dist",
                                         "theta", "main.nodeto", "branch.nodeto"))

all.data <- all.data[, -c(12, 14, 15, 17, 18, 20, 21, 23)]


colnames(all.data) <- c("node", "branch", "measurement", "endpoint", "is.in", 
                        "vert.dist", "hor.dist", "center.dist", "theta",
                        "main.nodeto", "branch.nodeto",
                        "value.date1", "value.date2", "value.real", "broken.real")


all.data$value.date1 <- as.numeric(all.data$value.date1)
all.data$value.date2 <- as.numeric(all.data$value.date2)
all.data$value.real <- as.numeric(all.data$value.real)

