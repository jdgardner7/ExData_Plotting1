# Jeffrey Gardner
# plot3.R

setwd("C:/Users/JG186057/workspace-r/")

dataset <- subset(read.table("household_power_consumption.txt", header = TRUE, sep=";",
	stringsAsFactors=FALSE, na.strings = "?"), 
	as.Date(Date, "%d/%m/%Y") == "2007-02-01" | as.Date(Date, "%d/%m/%Y") == "2007-02-02")

dataset$Date <- as.Date(dataset$Date, "%d/%m/%Y")
dataset$Time <- strptime(paste(dataset$Date, dataset$Time), "%F %H:%M:%S")

png('ExData_Plotting1/plot3.png', width = 480, height = 480, units = "px")

plot(dataset$Time,dataset$Sub_metering_1,xlab="", 
	ylab = "Energy sub metering", type = "l")  
lines(dataset$Time,dataset$Sub_metering_2,col="red")
lines(dataset$Time,dataset$Sub_metering_3,col="blue")

legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lwd = 1
	,col = c("black", "red", "blue"))

dev.off()