# model vs real analysis

# set wd
setwd("C:/Users/lscher/Documents/Github/tree-model-groundtruth-2018")

# INPUT BRANCH NUMBER AND MODEL DATES
tree <- "memorialoak"
branches <- c("01", "08", "09", "10", "13")
branches2 <- c("03", "05")
branch <- c("01", "03", "05", "08", "09", "10", "13")
date1 <- "171221"
date2 <- "180109"
dates <- c("171221", "180109")

library(ggplot2)

# read in all data
source("SCRIPTS/12.calculate.model.real.error.r")

# read in error functions
source("SCRIPTS/10.define.error.functions.r")


# correlations between model and real
summary(lm(all.data$value.real[which(all.data$measurement == "diameter")] ~ 
             all.data$value.date2[which(all.data$measurement == "diameter")]))






categories = c("value.real")
predictors = c("diameter", "length")
dates = c("date1", "date2")
endpoints = c("branch", "end")


names.test <- c("all.date1", "all.date2", 
                "diameter.date1", "length.date1", "diameter.date2", "length.date2", 
                "length.branch.date1", "length.end.date1", "length.branch.date2", "length.end.date2",
                "diameter.over5.date1", "diameter.over5.date2")

# R2 for ALL values, both dates
i <- 1
rsqrs <- c()
coefs <- c()
for (i in 1:length(dates)) {
  lm.test <- lm(all.data$value.real ~ 
                  all.data[[paste("value.", dates[i], sep = "")]])
  rsqrs[length(rsqrs) + 1] <- summary(lm.test)$adj.r.squared
  coefs[length(coefs) + 1] <- summary(lm.test)$coef[2,1]
  i <- i + 1
}

# R2 for diameter and length, both dates
i <- 1
for (i in 1:length(dates)) {
  j <- 1
  for (j in 1:length(predictors)) {
    lm.test <- lm(all.data$value.real[which(all.data$measurement == predictors[j])] ~
                    all.data[[paste("value.", dates[i], sep = "")]][which(all.data$measurement == predictors[j])])
    rsqrs[length(rsqrs) + 1] <- summary(lm.test)$adj.r.squared
    coefs[length(coefs) + 1] <- summary(lm.test)$coef[2,1]
    j <- j + 1
  }
  j <- j + 1
}


# R2 for length by endpoint
i <- 1
for (i in 1:length(dates)) {
  k <- 1
  for (k in 1:length(endpoints)) {
    lm.test <- lm(all.data$value.real[which(all.data$measurement == predictors[2] & all.data$endpoint == endpoints[k])] ~
                    all.data[[paste("value.", dates[i], sep = "")]][which(all.data$measurement == predictors[2] & all.data$endpoint == endpoints[k])])
    rsqrs[length(rsqrs) + 1] <- summary(lm.test)$adj.r.squared
    coefs[length(coefs) + 1] <- summary(lm.test)$coef[2,1]
    k <- k + 1
  }
  i <- i + 1
}


# R2 for diameter by size
i <- 1
for (i in 1:length(dates)) {
    lm.test <- lm(all.data$value.real[which(all.data$measurement == predictors[1] & all.data$value.real > 5)] ~
                    all.data[[paste("value.", dates[i], sep = "")]][which(all.data$measurement == predictors[1] & all.data$value.real > 5)])
    rsqrs[length(rsqrs) + 1] <- summary(lm.test)$adj.r.squared
    coefs[length(coefs) + 1] <- summary(lm.test)$coef[2,1]
  i <- i + 1
}



all.rsqrs <- as.data.frame(c(names.test))
colnames(all.rsqrs) <- "name"
all.rsqrs$value <- rsqrs


ggplot(data = all.rsqrs, 
       aes(x = all.rsqrs$name, y = all.rsqrs$value)) +
  geom_point() +
  theme(axis.text.x = element_text(angle = 45)) +
  scale_x_discrete(name = "predictor", 
                   limits=c("all.date1", "all.date2", 
                            "diameter.date1", "length.date1", "diameter.date2", "length.date2", 
                            "length.branch.date1", "length.end.date1", "length.branch.date2", "length.end.date2",
                            "diameter.over5.date1", "diameter.over5.date2"))





#plots
plot(x = all.data$value.real[which(all.data$measurement == "diameter")],
     y = all.data$perror.date1[which(all.data$measurement == "diameter")],
     col = "blue")
smooth(x = all.data$value.real[which(all.data$measurement == "diameter")],
       y = all.data$perror.date2[which(all.data$measurement == "diameter")],
       col = "red")
points(x = all.data$value.real[which(all.data$measurement == "diameter")],
       y = all.data$perror.avg[which(all.data$measurement == "diameter")],
       col = "purple")

boxplot(perror.avg)

mean(abs(all.data$error.date1[which(all.data$measurement == "diameter")]), na.rm = TRUE)
mean(abs(all.data$error.date1[which(all.data$measurement == "length" & 
                                      all.data$endpoint == "branch")]), na.rm = TRUE)
mean(abs(all.data$error.date2[which(all.data$measurement == "diameter")]), na.rm = TRUE)
mean(abs(all.data$error.date2[which(all.data$measurement == "length" & 
                                      all.data$endpoint == "branch")]), na.rm = TRUE)


plot(x = all.data$value.date1[which(all.data$measurement == "diameter" & as.numeric(all.data$value.real) >= 5)], 
     y = all.data$value.real[which(all.data$measurement == "diameter" & as.numeric(all.data$value.real) >= 5)],
     col = "blue")
points(x = all.data$value.date2[which(all.data$measurement == "diameter" & as.numeric(all.data$value.real) >= 5)], 
       y = all.data$value.real[which(all.data$measurement == "diameter" & as.numeric(all.data$value.real) >= 5)],
       col = "red")
rmse(all.data$perror.date1[which(all.data$measurement == "diameter" & as.numeric(all.data$value.real) >= 10)])

plot(x = all.data$value.date1[which(all.data$measurement == "length")], y = all.data$value.real[which(all.data$measurement == "length")])
points(x = all.data$value.date2[which(all.data$measurement == "length")], y = all.data$value.real[which(all.data$measurement == "length")])



plot(x = all.data$value.date1[which(all.data$value.real > 5)], y = all.data$value.real[which(all.data$value.real > 5)])
points(x = all.data$value.date2[which(all.data$value.real > 5)], y = all.data$value.real[which(all.data$value.real > 5)], col = "blue")


summary(lm(all.data$value.real[which(all.data$value.real < 5 & all.data$measurement == "diameter")] ~ 
             all.data$value.date1[which(all.data$value.real < 5 & all.data$measurement == "diameter")]))


plot(x = all.data$value.date1[which(all.data$measurement == "length" & all.data$endpoint == "branch")], 
     y = all.data$value.real[which(all.data$measurement == "length" & all.data$endpoint == "branch")])
points(x = all.data$value.date2[which(all.data$measurement == "length" & all.data$endpoint == "branch")], 
       y = all.data$value.real[which(all.data$measurement == "length" & all.data$endpoint == "branch")],
       col = "blue")

summary(lm(all.data$value.date1[which(all.data$measurement == "length" & all.data$endpoint == "branch")] ~ 
             all.data$value.real[which(all.data$measurement == "length" & all.data$endpoint == "branch")]))

plot(x = all.data$hor.dist[which(all.data$measurement == "diameter")], 
     y = all.data$perror.date1[which(all.data$measurement == "diameter")])

mean(all.data$perror.date1[which(all.data$measurement == "diameter" & all.data$value.real > 25)], na.rm = TRUE)
rmse(all.data$perror.date1[which(all.data$measurement == "length" & all.data$value.real > 175 & all.data$endpoint == "branch")])
