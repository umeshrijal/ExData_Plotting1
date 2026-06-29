# Clear workspace memory
rm(list = ls())

# 1. Load and subset data
dataFile <- "household_power_consumption.txt"
data <- read.table(dataFile, header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".", na.strings = "?")
subSetData <- data[data$Date %in% c("1/2/2007", "2/2/2007"), ]

# 2. Extract variable
globalActivePower <- as.numeric(subSetData$Global_active_power)

# 3. Open PNG device
png("plot1.png", width = 480, height = 480)

# 4. Generate histogram
hist(globalActivePower, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

# 5. Close device
dev.off()
cat("plot1.png generated successfully!\n")