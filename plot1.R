# Jeffrey Gardner
# plot1.R

setwd("C:/Users/JG186057/workspace-r/")

dataset <- subset(read.table("household_power_consumption.txt", header = TRUE, sep=";",
	stringsAsFactors=FALSE, na.strings = "?"), 
	as.Date(Date, "%d/%m/%Y") == "2007-02-01" | as.Date(Date, "%d/%m/%Y") == "2007-02-02")

png('ExData_Plotting1-master/plot1.png', width = 480, height = 480, units = "px")

hist(dataset$Global_active_power,main="Global Active Power",
	xlab = "Global Active Power (kilowatts)", col = "red")

dev.off()