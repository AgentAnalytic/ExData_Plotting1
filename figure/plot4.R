


#This script downloads the power consumtion data from the 
#url ("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip")
#and builds a 4 time trend graphs related to  Global Active Power in KW,Voltage,Sub_metering,Global reactive power
#over a 2 day time period and saves it in a png file.


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



# Plotting Plot 4:

png()


setwd("C:/Users/Portal X/Documents/Data Science Coursera/data/power/graph")

png(filename = "plot4.png")

par(mfrow = c(2,2))

plot(data_2days$dateTime , data_2days$Global_active_power, type = "l",ylab = "Global Active Power", xlab = "") 

plot(data_2days$dateTime , (data_2days$Voltage), type = "l",ylab = "Voltage", xlab = "datetime") 


plot(data_2days$dateTime , data_2days$Sub_metering_1, type = "n",ylab = "Energy sub metering", xlab = "")
points(data_2days$dateTime , data_2days$Sub_metering_1, type = "l",ylab = "Energy sub metering", xlab = "")
points(data_2days$dateTime , data_2days$Sub_metering_2, type = "l",ylab = "Energy sub metering", xlab = "",col = "red")
points(data_2days$dateTime , data_2days$Sub_metering_3, type = "l",ylab = "Energy sub metering", xlab = "",col = "blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col = c("black","red","blue"), lty = 1,cex = 0.75)

plot(data_2days$dateTime , data_2days$Global_reactive_power, type = "l", xlab = "datetime",ylab = "Global_reactive_power") 



dev.off()




