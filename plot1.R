# Load the data from input file
data <- read.csv("./data/household_power_consumption.txt", header = TRUE, sep = ";", na.strings="?")

# Convert date to date format
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

# Filter samples of dates 2007-02-01 and 2007-02-02
data <- data[data$Date == "2007-02-01" | data$Date == "2007-02-02",]

# Draw the histogram in the screen
hist(data$Global_active_power,xlab = "Global Active Power (kilowatts)", main = "Global Active Power", col = "red")

# Open a png graphics device
png(filename="figure/plot1.png")

# Draw the histogram in the png graphics device opened
hist(data$Global_active_power,xlab = "Global Active Power (kilowatts)", main = "Global Active Power", col = "red")

# Close the graphics device
dev.off()