## Plot 2 - Global Active Power Time Series
## Based on UCI Electric power consumption dataset

# Read in power consumption file and then subset for two target dates in "power2" table
power <- read.csv("household_power_consumption.txt",sep=";",na.strings="?")
power2 <- subset(power,power$Date=="1/2/2007"|power$Date=="2/2/2007")

# Consolidate Date and Time into Time column and then convert to POSIXlt format
power2$Time <- paste(power2$Date,power2$Time)
power2$Time <- strptime(power2$Time,"%d/%m/%Y %H:%M:%S")

# Open PNG graphic device to create file "plot1.png"
png(file="plot2.png",width=480,height=480)

# Generate time series plot for variable global active power
plot(power2$Time,power2$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")

# Turn off graphic devise to save file in working directory
dev.off()