## Plot 4 - Multiple Base Plots
## Based on UCI Electric power consumption dataset

# Read in power consumption file and then subset for two target dates in "power2" table
power <- read.csv("household_power_consumption.txt",sep=";",na.strings="?")
power2 <- subset(power,power$Date=="1/2/2007"|power$Date=="2/2/2007")

# Consolidate Date and Time into Time column and then convert to POSIXlt format
power2$Time <- paste(power2$Date,power2$Time)
power2$Time <- strptime(power2$Time,"%d/%m/%Y %H:%M:%S")

# Open PNG graphic device to create file "plot1.png"
png(file="plot4.png",width=480,height=480)

# Create parameters for 2x2 plot grid
par(mfrow = c(2,2))

# Create 1st plot of Global Active Power
plot(power2$Time,power2$Global_active_power, type="l", ylab="Global Active Power", xlab="")

# Create 2nd plot of VOltage
plot(power2$Time,power2$Voltage, type="l", ylab="Voltage", xlab="datetime")

# Create 3rd plot of Sub Metering measures
plot(power2$Time,power2$Sub_metering_1, type="l", xlab="",ylab="Energy sub metering")
lines(power2$Time, power2$Sub_metering_2, col="red")
lines(power2$Time, power2$Sub_metering_3, col="blue")

# Add legend
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))

# Create 4th plot of Global Reactive Power
plot(power2$Time,power2$Global_reactive_power, type="l", ylab="Global_reactive_power", xlab="datetime")

# Turn off graphic devise to save file in working directory
dev.off()