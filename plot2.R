# Jeffrey Gardner
# plot2.R

setwd("C:/Users/JG186057/workspace-r/")

dataset <- subset(read.table("household_power_consumption.txt", header = TRUE, sep=";",
	stringsAsFactors=FALSE, na.strings = "?"), 
	as.Date(Date, "%d/%m/%Y") == "2007-02-01" | as.Date(Date, "%d/%m/%Y") == "2007-02-02")

dataset$Date <- as.Date(dataset$Date, "%d/%m/%Y")
dataset$Time <- strptime(paste(dataset$Date, dataset$Time), "%F %H:%M:%S")

png('ExData_Plotting1/plot2.png', width = 480, height = 480, units = "px")

plot(dataset$Time, dataset$Global_active_power,xlab="", 
	ylab = "Global Active Power (kilowatts)", type = "l") 

dev.off()