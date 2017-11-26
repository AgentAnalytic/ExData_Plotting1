

#This script downloads the power consumtion data from the 
#url ("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip")
#and builds a histogram  output of Global Active Power in KW and saves it in a png file.


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

data <- read.csv("household_power_consumption.txt",sep = ";", stringsAsFactors=FALSE)


# Subsetting data for only 2007-02-01 & 2007-02-01

data$Date <- dmy(data$Date)


data_2days <- data[data$Date == "2007-02-01" | data$Date == "2007-02-02",]



data_2days$Global_active_power <- as.numeric(as.character(data_2days$Global_active_power))


png()

# Plotting Plot 1:


setwd("C:/Users/Portal X/Documents/Data Science Coursera/data/power/graph")


png(filename = "plot1.png")

hist(data_2days$Global_active_power,col = "red", main = "Global Active Power",xlab = "Global Active Power(Kilowatts)")

dev.off()



