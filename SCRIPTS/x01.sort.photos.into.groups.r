# make list of photos to include in photo number analysis
# need to end with list of photos in format "DJI_XXXX" "DJI_XXXX" "DJI_XXXX"

library(stringr)

tree <- "memorialoak"
date <- "17_12_21"
start <- 2
end <- 441
start2 <- 254
end2 <- 439

# make df
photos <- c(start:end)
df <- as.data.frame(photos)

# reduce photo set so it is divisible by 50
remainder <- length(photos) %% 50 # calculate how many to take out (remainder)
div <- length(photos)%/%remainder # calculate interval to remove one
df$out <- rep(1:div, length.out = length(photos)) # add column that numbers photos by interval

newphotos <- df$photos[which(df$out != div)] # make new list of photos that should now be divisible by 50
takeout <- length(newphotos) %% 50 # randomly take out this many rows

remove <- sample.int(length(newphotos), takeout) # randomly select index to remove
newphotos <- newphotos[-remove] # remove that index


# make new df with photo set that is divisible by 50
newdf <- as.data.frame(newphotos) # make new df
newdf$group <- rep(1:(length(newphotos)/50), length.out = length(newphotos)) # add column that groups photos into subsets
newdf$withzeros <- paste("000", newdf$newphotos, sep = "") # add column that adds 0s to numbers
newdf$final <- str_sub(newdf$withzeros, -4) # add column that removes extra 0s from beginning
newdf$photoname <- paste("DJI_", newdf$final, sep = "") # add column with string of names of photos

group1 <- newdf$photoname
group1 <- newdf$photoname[which(newdf$group != 1)]
length(group1)
group1



# copy files
my.file.copy <- function(from, to) {
  todir <- dirname(to)
  if (!isTRUE(file.info(todir)$isdir)) dir.create(todir, recursive=TRUE)
  file.copy(from = from,  to = to)
}



for (i in 1:length(group1)) {
  my.file.copy(from = paste("C:/Users/lscher/Desktop/17_12_21/", group1[i], ".jpg", sep = ""),
               to = paste("C:/Users/lscher/Desktop/model analysis subsets/", tree, "/", date, "/350", sep = ""))
}
warnings()
