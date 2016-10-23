########################################################################################################## 
## Project     : Coursera Exploratory Data Analysis 
## Author      : Neelani
## Created Date: 2016-10-23 
## Program     : Plot2.R 
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

## Draw Plot 2
plot(selData$Global_active_power~selData$DateTime, type="l", ylab="Global Active Power (kilowatts)", xlab="")

## Saving to file to PNG device 
dev.copy(png, file = "Plot2.png", width=480, height=480) 
dev.off() 