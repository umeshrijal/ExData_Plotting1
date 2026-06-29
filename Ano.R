# 1. Define the URL
file_url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for"

# 2. Read the fixed width file 
# Skip 4 lines of headers and define widths for all 9 columns
data <- read.fwf(
  file = url(file_url),
  skip = 4,
  widths = c(12, 7, 4, 9, 4, 9, 4, 9, 4)
)

# 3. Calculate the sum of the 4th column
sum(data[, 4])