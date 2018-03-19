library(dplyr)
library(lubridate)
setwd("C:\\Trainings\\datasciencecoursera\\ExData_Plotting1")
## Read data from the text file for 2007-02-01 and 2007-02-02.
data <- read.table("household_power_consumption.txt",sep = ";",skip = 66637, nrow = 2880)
## Assign column names
names(data) = c("Date","Time","Global_active_power","Global_reactive_power",
                "Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
## Convert the Global Active Poewr to numeric and exclude other columns which are not required
data <- data %>% select(Global_active_power) %>% mutate(Global_active_power = as.numeric(as.character(Global_active_power)))

png("plot1.png", width = 480, height = 480)
hist(data$Global_active_power, col ="red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)",
     ylab = "Frequency")
dev.off()