# 1. Install and load the modern package for handling Excel files
if(!require(openxlsx)) install.packages("openxlsx")
library(openxlsx)

# 2. Define the download URL
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"

# 3. Download the file. 
# CRITICAL: You MUST use mode = "wb" (write binary) for Excel files to prevent corruption!
download.file(url, destfile = "gas_program.xlsx", mode = "wb")

# 4. Read rows 18-23 and columns 7-15 into R and assign to 'dat'
dat <- read.xlsx("gas_program.xlsx", 
                 sheet = 1, 
                 rows = 18:23, 
                 cols = 7:15)

# 5. View your subsetted data frame
print(dat)

sum(dat$Zip * dat$Ext, na.rm=TRUE)

