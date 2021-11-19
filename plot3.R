library("lubridate")
#download the data to the working directory first. 

powercom<-read.table("household_power_consumption.txt", header=TRUE,sep=";",  na.strings = "?")


## change class of all columns to correct class
  powercom$Date <- as.Date(powercom$Date, format="%d/%m/%Y")

#take a subset of the data using data from the dates 2007-02-01 and 2007-02-02.

  plotset<-subset(powercom, as.Date("2007-02-01") <= Date & Date <=as.Date("2007-02-02"))

#combine date and time
  plotset$datetime<-paste(plotset$Date, plotset$Time)

# make plot 3

  with(plotset, plot(as.POSIXct(datetime), Sub_metering_1, type="l", ylab="Energy sub metering",
                   xlab="",
                   ylim=range(Sub_metering_1, Sub_metering_2, Sub_metering_1)))

  with(plotset, lines(as.POSIXct(datetime), Sub_metering_2, type='l', col='red'))
  with(plotset, lines(as.POSIXct(datetime), Sub_metering_3, type='l', col='blue', ))

  legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black","red", "blue"), lty=1:1, cex=0.8)

## Save file and close device
  dev.copy(png,"plot3.png", width=600, height=500)

  dev.off() ## Close the png file device
