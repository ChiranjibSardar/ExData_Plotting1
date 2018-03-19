library(dplyr)
library(lubridate)
setwd("C:\\Trainings\\datasciencecoursera\\ExData_Plotting1")
## Read data from the text file for 2007-02-01 and 2007-02-02.
data <- read.table("household_power_consumption.txt",sep = ";",skip = 66637, nrow = 2880)
## Assign column names
names(data) = c("Date","Time","Global_active_power","Global_reactive_power",
                "Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")


data <- data %>% mutate(datetime = as.POSIXct(strptime(paste(Date,Time, sep = " "),"%d/%m/%Y %H:%M:%S")),
                        Global_active_power = as.numeric(as.character(Global_active_power)),
                        Global_reactive_power = as.numeric(as.character(Global_reactive_power)),
                        Voltage = as.numeric(as.character(Voltage)),
                        Sub_metering_1 = as.numeric(as.character(data$Sub_metering_1)),
                        Sub_metering_2 = as.numeric(as.character(data$Sub_metering_2)),
                        Sub_metering_3 = as.numeric(as.character(data$Sub_metering_3))) 


png("plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))

with(data, plot(datetime, Global_active_power,type = 'l', xlab = "",ylab = "Global Active Power"))

with(data, plot(datetime, Voltage,type = 'l', xlab = "datetime",ylab = "Voltage"))


with(data, plot(datetime, Sub_metering_1, type = "n", xlab = "",ylab = "Energy sub metering"))
with(data, points(datetime, Sub_metering_1, type = "l", col = "black"))
with(data, points(datetime, Sub_metering_2, type = "l", col = "red"))
with(data, points(datetime, Sub_metering_3, type = "l", col = "blue"))
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty =1, lwd = 2, col = c("black","red","blue"))

with(data, plot(datetime, Global_reactive_power,type = 'l', xlab = "datetime",ylab = "Global_reactive_power"))

dev.off()
