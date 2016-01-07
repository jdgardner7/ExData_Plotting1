# Jeffrey Gardner
# plot4.R

setwd("C:/Users/JG186057/workspace-r/")

dataset <- subset(read.table("household_power_consumption.txt", header = TRUE, sep=";",
	stringsAsFactors=FALSE, na.strings = "?"), 
	as.Date(Date, "%d/%m/%Y") == "2007-02-01" | as.Date(Date, "%d/%m/%Y") == "2007-02-02")

dataset$Date <- as.Date(dataset$Date, "%d/%m/%Y")
dataset$Time <- strptime(paste(dataset$Date, dataset$Time), "%F %H:%M:%S")

png('ExData_Plotting1/plot4.png', width = 480, height = 480, units = "px")

op <- par(mfrow = c(2, 2))

plot(dataset$Time, dataset$Global_active_power,xlab="", 
	ylab = "Global Active Power (kilowatts)", type = "l") 

plot(dataset$Time,dataset$Voltage,xlab="datetime",ylab="Voltage",type = "l")

plot(dataset$Time,dataset$Sub_metering_1,xlab="", 
	ylab = "Energy sub metering", type = "l")  
lines(dataset$Time,dataset$Sub_metering_2,col="red")
lines(dataset$Time,dataset$Sub_metering_3,col="blue")

legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
	lwd = 1,col = c("black", "red", "blue"), bty="n")

plot(dataset$Time,dataset$Global_reactive_power,xlab="datetime",
	ylab="Global_reactive_power",type = "l")

par(op)
dev.off()