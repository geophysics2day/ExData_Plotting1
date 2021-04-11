colnames <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";",col.names = colnames)
DateTime <- paste(data$Date, data$Time, sep = " ")
DateFixed <- strptime(DateTime,"%d/%m/%Y %H:%M:%S") ##Standardize the date/time format 
data$Date <- DateFixed ## Add standardized date/time data to data frame
## Restrict data to dates of interest
dataSelect <- subset(data, (Date >= "2007-02-01" & Date <="2007-02-03"), select = c("Date","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"))

##Plot 3

with(dataSelect, plot(Date,Sub_metering_1, pch = '.', ylab = "Energy sub metering"), type = "n")
lines(dataSelect$Date, dataSelect$Sub_metering_1, pch = '.', type = "l", lty = 1, lwd = 1.5, col = "black")
lines(dataSelect$Date, dataSelect$Sub_metering_2, pch = '.', type = "l", lty = 1, lwd = 1.5, col = "red")
lines(dataSelect$Date, dataSelect$Sub_metering_3, pch = '.', type = "l", lty = 1, lwd = 1.5, col = "blue")
legend("topright", lty = 1, col = c("black","red", "blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.copy(png, file = "plot3.png") ## Copy to PNG
dev.off() ## Closing the png