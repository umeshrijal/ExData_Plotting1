rm(list = ls())

# 1. Load and subset data
# Note: Missing values are explicitly coded as "?" in this dataset
dataFile <- "household_power_consumption.txt"
data <- read.table(dataFile, header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".", na.strings = "?")

# 2. Subset data for the specific target dates: Feb 1, 2007 and Feb 2, 2007
subSetData <- data[data$Date %in% c("1/2/2007", "2/2/2007"), ]

# 3. Preprocess and convert variables
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep = " "), "%d/%m/%Y %H:%M:%S") 
globalActivePower   <- as.numeric(subSetData$Global_active_power)
globalReactivePower <- as.numeric(subSetData$Global_reactive_power)
voltage             <- as.numeric(subSetData$Voltage)
subMetering1        <- as.numeric(subSetData$Sub_metering_1)
subMetering2        <- as.numeric(subSetData$Sub_metering_2)
subMetering3        <- as.numeric(subSetData$Sub_metering_3)

# 4. Open the PNG graphics device (Width and Height specified at 480x480 pixels)
png("plot4.png", width = 480, height = 480)

# 5. Configure the canvas grid layout to hold 4 plots (2 rows, 2 columns)
par(mfrow = c(2, 2)) 

# --- Plot Top-Left: Global Active Power ---
plot(datetime, globalActivePower, type = "l", xlab = "", ylab = "Global Active Power", cex = 0.2)

# --- Plot Top-Right: Voltage ---
plot(datetime, voltage, type = "l", xlab = "datetime", ylab = "Voltage")

# --- Plot Bottom-Left: Energy Sub Metering ---
plot(datetime, subMetering1, type = "l", ylab = "Energy sub metering", xlab = "")
lines(datetime, subMetering2, type = "l", col = "red")
lines(datetime, subMetering3, type = "l", col = "blue")
# Note: bty = "n" removes the box border around the legend matching the reference plot
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, lwd = 2.5, col = c("black", "red", "blue"), bty = "n")

# --- Plot Bottom-Right: Global Reactive Power ---
plot(datetime, globalReactivePower, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

# 6. Close the device and save the file cleanly
dev.off()

cat("Success! plot4.png has been generated in your working directory.\n")