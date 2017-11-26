

#This script downloads the power consumtion data from the 
#url ("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip")
#and builds a time trend graph of Global Active Power in KW over the 2 days time period and saves it in a png file.


#download the file and unzip

library(dplyr)
library(lubridate)

setwd("C:/Users/Portal X/Documents/Data Science Coursera/data/power")

url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

if(!file.exists("powerzip.zip")){
  download.file(url,destfile = "C:/Users/Portal X/Documents/Data Science Coursera/data/power/powerzip.zip")
  
  unzip("powerzip")
}


#loading the data

data <- read.csv("household_power_consumption.txt",sep = ";",stringsAsFactors=FALSE)


# Subsetting data for only 2007-02-01 & 2007-02-01

data$Date <- dmy(data$Date)


data_2days <- data[data$Date == "2007-02-01" | data$Date == "2007-02-02",]



data_2days$Global_active_power <- as.numeric(as.character(data_2days$Global_active_power))
data_2days$dateTime <- as.POSIXct(paste(data_2days$Date, data_2days$Time))



png()

# Plotting Plot 2:

setwd("C:/Users/Portal X/Documents/Data Science Coursera/data/power/graph")

png(filename = "plot2.png")


plot(data_2days$dateTime , data_2days$Global_active_power, type = "l",ylab = "Global Active Power(Kilowatts)", xlab = "")

dev.off()
