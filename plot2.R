# Load the data from input file
data <- read.csv("./data/household_power_consumption.txt", header = TRUE, sep = ";", na.strings="?")

# Convert date to date format
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

# Filter samples of dates 2007-02-01 and 2007-02-02
data <- data[data$Date == "2007-02-01" | data$Date == "2007-02-02",]

# Create a new variable with date and time combined called "datetime"
data <- data.frame(data, datetime = as.POSIXct(paste(data$Date, data$Time), format = "%Y-%m-%d %H:%M:%S"))

# Draw the plot in the screen
plot(data$datetime,data$Global_active_power, ylab = "Global Active Power (kilowatts)", xlab = "",
     type = "l")

# Open a png graphics device
png(filename="figure/plot2.png")

# Draw the plot in the png graphic deviced already opened
plot(data$datetime,data$Global_active_power, ylab = "Global Active Power (kilowatts)", xlab = "",
     type = "l")

# Close the graphics device
dev.off()