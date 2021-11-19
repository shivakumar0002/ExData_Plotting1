#This assignment uses data from the UC Irvine Machine Learning Repository, 
#a popular repository for machine learning datasets. In particular, we will 
#be using the “Individual household electric power consumption Data Set” 
#which I have made available on the course web site:

#download the data to the working directory first. 

  powercom<-read.table("household_power_consumption.txt", header=TRUE,sep=";",  na.strings = "?")
 

## change class of all columns to correct class
  powercom$Date <- as.Date(powercom$Date, format="%d/%m/%Y")

#take a subset of the data using data from the dates 2007-02-01 and 2007-02-02.

  plotset<-subset(powercom, as.Date("2007-02-01") <= Date & Date <=as.Date("2007-02-02"))

  library("lubridate")

#The first plot

  hist(plotset$Global_active_power, col="red", xlab="Global Acitve Power (kilowatts)",
     main="Global Active Power")

#save the plot to the file plot1.pin

  dev.copy(png,"plot1.png", width=480, height=480)
  dev.off()
