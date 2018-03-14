# find angle of each node

#Date 1

# center lat and long around origin
all.loc.data.date1$meterslat.or <- all.loc.data.date1$meterslat - date1_centerpointdf$meterslat
all.loc.data.date1$meterslong.or <- all.loc.data.date1$meterslong - date1_centerpointdf$meterslong

# calculate theta in radians
all.loc.data.date1$theta <- (atan2(all.loc.data.date1$meterslat.or, all.loc.data.date1$meterslong.or) - 
              atan2(all.loc.data.date1$meterslat.or[1], all.loc.data.date1$meterslong.or[1]))

# convert theta to degrees
all.loc.data.date1$thetadeg <- (180/pi) * all.loc.data.date1$theta



#Date 2

# center lat and long around origin
all.loc.data.date2$meterslat.or <- all.loc.data.date2$meterslat - date2_centerpointdf$meterslat
all.loc.data.date2$meterslong.or <- all.loc.data.date2$meterslong - date2_centerpointdf$meterslong

# calculate theta in radians
all.loc.data.date2$theta <- (atan2(all.loc.data.date2$meterslat.or, all.loc.data.date2$meterslong.or) - 
                               atan2(all.loc.data.date2$meterslat.or[1], all.loc.data.date2$meterslong.or[1]))

# convert theta to degrees
all.loc.data.date2$thetadeg <- (180/pi) * all.loc.data.date2$theta