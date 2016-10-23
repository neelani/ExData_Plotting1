########################################################################################################## 
## Project     : Coursera Exploratory Data Analysis 
## Author      : Neelani
## Created Date: 2016-10-23 
## Program     : Plot4.R 
######################################################################################################### 

# Set the working directory
setwd("V:/MBA-Stevens/Data Science/04 Exploratory Data Analysis/Week 01")

# load the required packages
packages <- c("data.table")

## Read in the data from household_power_consumption.txt
dataFile <- "./data/household_power_consumption.txt" 
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".") 

## Convert the date value to "Date" attribute using as.Date function
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

## select the data only for 2007-02-01 and 2007-02-02 date range    
selData <- subset(data, (Date >= "2007-02-01" & Date <= "2007-02-02"))

## Combine Date & Time into one attribute  
dateTime <- paste(as.Date(selData$Date), selData$Time)
selData$DateTime <- as.POSIXct(dateTime)

## Draw Plot 3
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0)) 
with(selData, { 
               plot(Global_active_power~DateTime, type="l", ylab="Global Active Power (kilowatts)", xlab="") 
               plot(Voltage~DateTime, type="l", ylab="Voltage (volt)", xlab="DateTime") 
               plot(Sub_metering_1~DateTime, type="l", ylab="Global Active Power (kilowatts)", xlab="") 
               lines(Sub_metering_2~DateTime,col='Red') 
               lines(Sub_metering_3~DateTime,col='Blue') 
               legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n", 
               legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")) 
               plot(Global_reactive_power~DateTime, type="l", ylab="Global Rective Power (kilowatts)",xlab="DateTime") 
              }) 

## Saving to file to PNG device 
dev.copy(png, file = "Plot4.png", width=480, height=480) 
dev.off() 