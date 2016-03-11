require(dplyr)
require(tidyr)
require(ggmap)

newyork <- get_map(location = "New York", zoom = 11)
ggmap(newyork)

##lat long coordinates rounded to 2 sig digits
mydata<- read.csv("HHW2.csv", header=T, sep=',')


heatmap <- as.data.frame(table(mydata$Longitude, mydata$Latitude))
names(heatmap) <- c('long', 'lat', 'Frequency')
View(heatmap)


heatmap$long <- as.numeric(as.character(heatmap$long))
heatmap$lat <- as.numeric(as.character(heatmap$lat))

heatmap <- subset(heatmap, Freq > 0)

heatmap <- subset(heatmap, Frequency > 0)
ggmap(newyork) + geom_tile(data = heatmap, aes(x = long, y = lat, alpha = Frequency),
fill = 'red') + theme(axis.title.y = element_blank(), axis.title.x = element_blank())
