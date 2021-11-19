library("lubridate")

#download the data to the working directory first. 

  powercom<-read.table("household_power_consumption.txt", header=TRUE,sep=";",  na.strings = "?")


## change class of all columns to correct class
  powercom$Date <- as.Date(powercom$Date, format="%d/%m/%Y")

#take a subset of the data using data from the dates 2007-02-01 and 2007-02-02.

  plotset<-subset(powercom, as.Date("2007-02-01") <= Date & Date <=as.Date("2007-02-02"))


#combine date and time
  plotset$datetime<-paste(plotset$Date, plotset$Time)


#make plot 2


  with(plotset, plot(as.POSIXct(datetime), Global_active_power, type="l", xlab=""
                   , ylab="Global Acitve Power (kilowatts)"))

## Save file and close device
  dev.copy(png,"plot2.png", width=480, height=480)

  dev.off() ## Close the png file device
