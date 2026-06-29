pollutantmean <- function(directory, pollutant, id = 1:332) {
  all_data <- numeric()
  
  for (monitor in id) {
    # Format the file name to have leading zeros (e.g., 1 becomes "001.csv")
    file_name <- sprintf("%03d.csv", monitor)
    
    # Combine the directory path and file name
    file_path <- file.path(directory, file_name)
    
    # Read the CSV file
    current_file <- read.csv(file_path)
    
    # Extract the specific pollutant column and append it to our vector
    all_data <- c(all_data, current_file[[pollutant]])
  }
  
  # Calculate and return the mean, explicitly removing NA values
  return(mean(all_data, na.rm = TRUE))
}