# reshape measurement data

library(reshape2)

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

# add column for branch
all.data$branch <- NA
all.data$branch[which(all.data$variable == "maindiameter.date1" | 
                             all.data$variable == "mainlength.date1" |
                             all.data$variable == "maindiameter.date2" |
                             all.data$variable == "mainlength.date2")] <- "main"
all.data$branch[which(all.data$variable == "branchdiameter.date1" | 
                             all.data$variable == "branchlength.date1" |
                             all.data$variable == "branchdiameter.date2" |
                             all.data$variable == "branchlength.date2")] <- "branch"

# add column for measurement
all.data$measurement <- NA
all.data$measurement[which(all.data$variable == "maindiameter.date1" | 
                                  all.data$variable == "branchdiameter.date1" |
                                  all.data$variable == "maindiameter.date2" |
                                  all.data$variable == "branchdiameter.date2")] <- "diameter"
all.data$measurement[which(all.data$variable == "mainlength.date1" | 
                                  all.data$variable == "branchlength.date1" |
                                  all.data$variable == "mainlength.date2" |
                                  all.data$variable == "branchlength.date2")] <- "length"

# add column for endpoint
all.data$endpoint <- "branch"
all.data$endpoint[which(all.data$branch == "main" & 
                               all.data$main.nodeto == "end")] <- "end"
all.data$endpoint[which(all.data$branch == "branch" & 
                               all.data$branch.nodeto == "end")] <- "end"



date1data <- all.data[which(all.data$date == "date1"),]
date2data <- all.data[which(all.data$date == "date2"),]


all.data <- merge(date1data, date2data, by = c("node", "branch", "measurement", "endpoint",
                                               "is.in.x", "vert.dist", "center.dist", "hor.dist",
                                               "theta", "main.nodeto", "branch.nodeto"))

all.data$value.date1 <- all.data$value.x
all.data$value.date2 <- all.data$value.y
all.data <- all.data[,-c(12:17)]

