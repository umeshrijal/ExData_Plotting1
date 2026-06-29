getwd()
# 1. Download the file from the provided URL
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(url, destfile = "idaho_housing.csv", method = "curl")

# 2. Load the data into R
housing_data <- read.csv("idaho_housing.csv")

# 3. Count how many properties are worth $1,000,000 or more (where VAL == 24)
# We use na.rm = TRUE because some rows might have NA (missing data) for VAL
result <- sum(housing_data$VAL == 24, na.rm = TRUE)

# 4. Print the result
print(result)
