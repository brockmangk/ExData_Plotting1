## Plot 3 - Energy Sub Metering Time Series
## Based on UCI Electric power consumption dataset

# Read in power consumption file and then subset for two target dates in "power2" table
power <- read.csv("household_power_consumption.txt",sep=";",na.strings="?")
power2 <- subset(power,power$Date=="1/2/2007"|power$Date=="2/2/2007")

# Consolidate Date and Time into Time column and then convert to POSIXlt format
power2$Time <- paste(power2$Date,power2$Time)
power2$Time <- strptime(power2$Time,"%d/%m/%Y %H:%M:%S")

# Open PNG graphic device to create file "plot1.png"
png(file="plot3.png",width=480,height=480)

# Generate time series plot for sub meter #1
plot(power2$Time,power2$Sub_metering_1, type="l", xlab="",ylab="Energy sub metering")

# Add a red plot line for sub meter #2
lines(power2$Time, power2$Sub_metering_2, col="red")

# Add a blue plot line for sub meter #3
lines(power2$Time, power2$Sub_metering_3, col="blue")

# Add legend
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))

# Turn off graphic devise to save file in working directory
dev.off()