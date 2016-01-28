# Load the data from input file
data <- read.csv("./data/household_power_consumption.txt", header = TRUE, sep = ";", na.strings="?")

# Convert date to date format
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

# Filter samples of dates 2007-02-01 and 2007-02-02
data <- data[data$Date == "2007-02-01" | data$Date == "2007-02-02",]

# Create a new variable with date and time combined called "datetime"
data <- data.frame(data, datetime = as.POSIXct(paste(data$Date, data$Time), format = "%Y-%m-%d %H:%M:%S"))

# Divide the plot area in a 2x2 matrix
par(mfrow = c(2,2))

# Draw plot 1,1
plot(data$datetime,data$Global_active_power, ylab = "Global Active Power", xlab = "",
     type = "l")

# Draw plot 1,2
plot(data$datetime,data$Voltage, ylab = "Voltage", xlab = "datetime", type = "l")

# Draw plot 2,1
plot(data$datetime,data$Sub_metering_1, ylab = "Energy sub metering", xlab = "",
     type = "n")
# Add to opened plot a line for data sub metering 1
lines(data$datetime,data$Sub_metering_1,col="black")
# Add to opened plot a line for data sub metering 2
lines(data$datetime,data$Sub_metering_2,col="red")
# Add to opened plot a line for data sub metering 3
lines(data$datetime,data$Sub_metering_3,col="blue")
# Add the legend to the plot
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       col = c("black","red","blue"), lty = 1)

# Draw plot 2,2
plot(data$datetime,data$Global_reactive_power, ylab = "Global_reactive_power", 
     xlab = "datetime", type = "l")

# Open a png graphics device
png(filename="figure/plot4.png")

# Divide the plot area in a 2x2 matrix
par(mfrow = c(2,2))

# Draw plot 1,1
plot(data$datetime,data$Global_active_power, ylab = "Global Active Power", xlab = "",
     type = "l")

# Draw plot 1,2
plot(data$datetime,data$Voltage, ylab = "Voltage", xlab = "datetime", type = "l")

# Draw plot 2,1
plot(data$datetime,data$Sub_metering_1, ylab = "Energy sub metering", xlab = "",
     type = "n")
# Add to opened plot a line for data sub metering 1
lines(data$datetime,data$Sub_metering_1,col="black")
# Add to opened plot a line for data sub metering 2
lines(data$datetime,data$Sub_metering_2,col="red")
# Add to opened plot a line for data sub metering 3
lines(data$datetime,data$Sub_metering_3,col="blue")
# Add the legend to the plot
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       col = c("black","red","blue"), lty = 1)

# Draw plot 2,2
plot(data$datetime,data$Global_reactive_power, ylab = "Global_reactive_power", 
     xlab = "datetime", type = "l")

# Close the graphics device
dev.off()