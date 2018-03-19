library(dplyr)
library(lubridate)
setwd("C:\\Trainings\\datasciencecoursera\\ExData_Plotting1")
## Read data from the text file for 2007-02-01 and 2007-02-02.
data <- read.table("household_power_consumption.txt",sep = ";",skip = 66637, nrow = 2880)
## Assign column names
names(data) = c("Date","Time","Global_active_power","Global_reactive_power",
                "Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")




datetime <- strptime(paste(data$Date,data$Time, sep = " "),"%d/%m/%Y %H:%M:%S")
submeter1 <- as.numeric(as.character(data$Sub_metering_1))
submeter2 <- as.numeric(as.character(data$Sub_metering_2))
submeter3 <- as.numeric(as.character(data$Sub_metering_3))


png("plot3.png", width = 480, height = 480)
plot(datetime, submeter1, type = "l", xlab = "",ylab = "Energy sub metering")
lines(datetime, submeter2, type = "l", col = "red")
lines(datetime, submeter3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty =1, lwd = 2, col = c("black","red","blue"))

dev.off()