
# INPUT BRANCH NUMBER AND MODEL DATES
tree <- "elm"
branch <- c("01", "02", "03", "04", "10", "14", "15")
dates <- c("180222", "180323")

source("../SCRIPTS/000.read.in.data.r")

# rename data
elm.all.data <- all.data
elm.all.data$tree <- "elm"

#######

tree <- "walnut2"
branch <- c("01", "06", "07", "11", "12", "13", "14")
dates <- c("180228", "180328")

source("../SCRIPTS/000.read.in.data.r")

# rename data
walnut2.all.data <- all.data
walnut2.all.data$tree <- "walnut2"

######
tree <- "memorialoak"
branch <- c("01", "03", "05", "08", "09", "10", "13")
dates <- c("171221", "180109")

source("../SCRIPTS/000.read.in.data.r")

memorialoak.all.data <- all.data
memorialoak.all.data$tree <- "memorialoak"

comb.all.data <- rbind(walnut2.all.data, memorialoak.all.data, elm.all.data)