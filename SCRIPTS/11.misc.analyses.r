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



# elm distal segments compared to wal and oak

distal <- l.all.data[which(l.all.data$endpoint == "end"),]
distal$tree2 <- "not" 
distal$tree2[which(distal$tree == "elm")] <- "elm"

distal1 <- distal[c("diam", "error.date1", "tree2")]
distal2 <- distal[c("diam", "error.date2", "tree2")]
colnames(distal1) <- c("diam", "error", "tree")
colnames(distal2) <- c("diam", "error", "tree")

distalcomb <- rbind(distal1, distal2)

t.test(distalcomb$error ~ distalcomb$tree)
