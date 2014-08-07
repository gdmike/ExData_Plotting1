## Exploratory Data - Assignment 1

## NOTE - file name changed to power.txt for simplicity in coding
## Read in the file
powerInfo<-read.table("power.txt", sep=";",header=TRUE)

## Get just the dates of interest
plotData <- subset(powerInfo, powerInfo$Date == "1/2/2007" | powerInfo$Date == "2/2/2007")

plotData$Date<-as.Date(plotData$Date, "%d/%m/%Y")
plotData$DT <- as.POSIXct(paste(plotData$Date, plotData$Time), format="%Y-%m-%d %H:%M:%S")

## Get the data to plot and make it numeric rather than a factor
gap<-data.frame(plotData$DT, as.numeric(as.character(plotData$Global_active_power)))


## Plot the historgram
plot(gap[,1],gap[,2],type="l",xlab=" ",ylab="Global Active Power (kilowatts)")

## copy the output to a png file and then close that device
dev.copy(png, file = "plot2.png", width=480,height=480,units="px") #
dev.off() ## Don't forget to close the PNG device!




