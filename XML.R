# 1. Install and load the xml2 package
if(!require(xml2)) install.packages("xml2")
library(xml2)

# 2. Define the secure URL
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"

# 3. Read the XML data
xml_data <- read_xml(url)

# 4. Use an XPath query to target only zipcode elements with the exact text value
matching_zipcodes <- xml_find_all(xml_data, ".//zipcode[text()='21231']")

# 5. Count the length of the vector
result <- length(matching_zipcodes)
print(result)