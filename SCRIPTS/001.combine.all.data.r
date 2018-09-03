
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
branch <- c("01", "03", "04", "06", "07", "11", "12", "13", "14")
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

comb.all.data$main.nodeto[which(comb.all.data$main.nodeto == "")] <- NA
comb.all.data$branch.nodeto[which(comb.all.data$branch.nodeto == "")] <- NA
comb.all.data$value.date1[which(comb.all.data$value.date1 == "")] <- NA
comb.all.data$value.date2[which(comb.all.data$value.date2 == "")] <- NA
comb.all.data$value.real[which(comb.all.data$value.real == "")] <- NA
comb.all.data$broken.real[which(comb.all.data$broken.real == "")] <- NA

