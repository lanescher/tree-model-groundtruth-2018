# find angle of each node

# center lat and long around origin
all.loc.data.date1$meterslat.or <- all.loc.data.date1$meterslat - date1_centerpointdf$meterslat
all.loc.data.date1$meterslong.or <- all.loc.data.date1$meterslong - date1_centerpointdf$meterslong

# calculate theta in radians
all.loc.data.date1$theta <- (atan2(all.loc.data.date1$meterslat.or, all.loc.data.date1$meterslong.or) - 
              atan2(all.loc.data.date1$meterslat.or[1], all.loc.data.date1$meterslong.or[1]))

# convert theta to degrees
all.loc.data.date1$thetadeg <- (180/pi) * all.loc.data.date1$theta
