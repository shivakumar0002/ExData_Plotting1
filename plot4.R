library("lubridate")

#download the data to the working directory first. 

powercom<-read.table("household_power_consumption.txt", header=TRUE,sep=";",  na.strings = "?")


## change class of all columns to correct class
  powercom$Date <- as.Date(powercom$Date, format="%d/%m/%Y")

#take a subset of the data using data from the dates 2007-02-01 and 2007-02-02.

  plotset<-subset(powercom, as.Date("2007-02-01") <= Date & Date <=as.Date("2007-02-02"))

#combine date and time
  plotset$datetime<-paste(plotset$Date, plotset$Time)


#set graphical parameters
  par(mfrow=c(2,2),mar=c(4,4,2,1))  

# graph at top-left corner
  with(plotset, plot(as.POSIXct(datetime), Global_active_power, xlab="",
                   ylab="Global Active Power", type="l"))
#graph at top-right corner

  with(plotset, plot(as.POSIXct(datetime), Voltage, xlab="datetime",
                   ylab="Voltage", type="l"))
#graph at bottom-left corner

  with(plotset, plot(as.POSIXct(datetime), Sub_metering_1, type="l", ylab="Energy sub metering",
                   xlab="",
                   ylim=range(Sub_metering_1, Sub_metering_2, Sub_metering_1)))

  with(plotset, lines(as.POSIXct(datetime), Sub_metering_2, type='l', col='red'))
  with(plotset, lines(as.POSIXct(datetime), Sub_metering_3, type='l', col='blue', ))

  legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black","red", "blue"), lty=1:1, cex=0.8, bty="n")
#the type of box to be drawn around the legend

#graph at bottom-right corner

  with(plotset, plot(as.POSIXct(datetime), Global_reactive_power, xlab="datetime",
                   , type="l"))

## Save file and close device
  dev.copy(png,"plot4.png", width=480, height=480)

  dev.off() ## Close the png file device
