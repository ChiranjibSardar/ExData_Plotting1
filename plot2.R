library(dplyr)
library(lubridate)
setwd("C:\\Trainings\\datasciencecoursera\\ExData_Plotting1")
## Read data from the text file for 2007-02-01 and 2007-02-02.
data <- read.table("household_power_consumption.txt",sep = ";",skip = 66637, nrow = 2880)
## Assign column names
names(data) = c("Date","Time","Global_active_power","Global_reactive_power",
                "Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
## Convert the Global Active Poewr to numeric 
Global.Active.Power <- as.numeric(as.character(data$Global_active_power))
## Combine and convert the Date and Time field into date/time format
datetime <- strptime(paste(data$Date,data$Time, sep = " "),"%d/%m/%Y %H:%M:%S")


png("plot2.png", width = 480, height = 480)
plot(datetime, Global.Active.Power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()