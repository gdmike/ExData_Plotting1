## Exploratory Data - Assignment 1

## NOTE - file name changed to power.txt for simplicity in coding
## Read in the file
powerInfo<-read.table("power.txt", sep=";",header=TRUE)

## Get just the dates of interest
plotData <- subset(powerInfo, powerInfo$Date == "1/2/2007" | powerInfo$Date == "2/2/2007")

## Get the data to plot and make it numeric rather than a factor
gap<-as.character(plotData$Global_active_power)
gap<-as.numeric(gap)

## Plot the historgram
hist(gap, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")

## copy the output to a png file and then close that device
dev.copy(png, file = "plot1.png", width=480,height=480,units="px") 
dev.off() ## Don't forget to close the PNG device!
