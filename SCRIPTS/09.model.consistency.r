# start testing how consistent measurements are from one model to another

# calculate percent error between models
all.data$maindiameter.err <- abs((all.data$maindiameter.date1 - all.data$maindiameter.date2) / all.data$maindiameter.date1)
all.data$mainlength.err <- abs((all.data$mainlength.date1 - all.data$mainlength.date2) / all.data$mainlength.date1)
all.data$branchdiameter.err <- abs((all.data$branchdiameter.date1 - all.data$branchdiameter.date2) / all.data$branchdiameter.date1)
all.data$branchlength.err <- abs((all.data$branchlength.date1 - all.data$branchlength.date2) / all.data$branchlength.date1)


plot(x = all.data$hor.dist[which(all.data$main.nodeto != "end")], y = all.data$branchlength.err[which(all.data$main.nodeto != "end")])

hist(all.data$branchlength.err)
