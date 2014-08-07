## Exploratory Data - Assignment 1

## NOTE - file name changed to power.txt for simplicity in coding
## Read in the file
powerInfo<-read.table("power.txt", sep=";",header=TRUE)

## Get just the dates of interest
plotData <- subset(powerInfo, powerInfo$Date == "1/2/2007" | powerInfo$Date == "2/2/2007")

##Reformat the data for use in the plot
plotData$Date<-as.Date(plotData$Date, "%d/%m/%Y")
plotData$DT <- as.POSIXct(paste(plotData$Date, plotData$Time), format="%Y-%m-%d %H:%M:%S")

## Get just the data I am plotting and make the power info numeric
gap<-data.frame(plotData$DT, as.numeric(as.character(plotData$Sub_metering_1)),
                as.numeric(as.character(plotData$Sub_metering_2)),
                as.numeric(as.character(plotData$Sub_metering_3)))

## Create the file to write to
png(filename = 'plot3.png', width = 480, height = 480, units = 'px')

## Plot the first set of data...
plot(gap[,1],gap[,2],type="l",xlab=" ",ylab="Energy sub metering")

## Plot the remaining 2 data sets
lines(gap[,1], gap[,3], col="red")
lines(gap[,1], gap[,4], col="blue")

## Add the legend
legend("topright", xjust=1, lwd=2, lty = 1, col = c("black", "red","blue"), legend = c("Sub_metering_1","Sub_metering_2",
                     "Sub_metering_3"))

dev.off() ## Don't forget to close the PNG device!











