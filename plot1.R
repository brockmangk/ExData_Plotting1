## Plot 1 - Global Active Power Histogram
## Based on UCI Electric power consumption dataset

# Read in power consumption file and then subset for two target dates in "power2" table
power <- read.csv("household_power_consumption.txt",sep=";",na.strings="?")
power2 <- subset(power,power$Date=="1/2/2007"|power$Date=="2/2/2007")

# Open PNG graphic device to create file "plot1.png"
png(file="plot1.png",width=480,height=480)

# Generate histogram plot for variable global active power
hist(power2$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)",ylab="Frequency")

# Turn off graphic devise to save file in working directory
dev.off()