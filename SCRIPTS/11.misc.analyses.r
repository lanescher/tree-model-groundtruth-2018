# calculate p values for results

# 5cm
diamerror$`5cm` <- NA
diamerror$`5cm`[which(diamerror$value.real < 5)] <- "<5"
diamerror$`5cm`[which(diamerror$value.real > 5)] <- ">5"

t.test(diamerror$perror ~ diamerror$`5cm`)


# 10 cm
diamerror$`10cm` <- NA
diamerror$`10cm`[which(diamerror$value.real < 10)] <- "<10"
diamerror$`10cm`[which(diamerror$value.real > 10)] <- ">10"

t.test(diamerror$error ~ diamerror$`10cm`)


max(alllenerror$diam, na.rm = T)




# consistency

# absolute > 20
d.all.data$`20` <- "<20"
d.all.data$`20`[which(d.all.data$value.real >= 20)] <- ">20"

t.test(d.all.data$error ~ d.all.data$`20`)

# relative difference >10
d.all.data$`10` <- "<10"
d.all.data$`10`[which(d.all.data$value.real >= 10)] <- ">10"

t.test(d.all.data$perror ~ d.all.data$`10`)


