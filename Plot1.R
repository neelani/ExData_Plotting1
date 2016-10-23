########################################################################################################## 
## Project     : Coursera Exploratory Data Analysis 
## Author      : Neelani
## Created Date: 2016-10-23 
## Program     : Plot1.R 
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

## Draw Plot 1
hist(as.numeric(selData$Global_active_power), col="red", 
                main = "Global Active Power", 
                xlab = "Global Active Power (kilowatts)",  ylab = "Frequency" )

## Saving to file to PNG device 
dev.copy(png, file = "Plot1.png", width=480, height=480) 
dev.off() 