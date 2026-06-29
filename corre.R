corr <- function(directory, threshold = 0) {
  # 1. Get a list of all file paths in the directory
  all_files <- list.files(directory, full.names = TRUE)
  
  # 2. Initialize an empty numeric vector to store correlations
  correlations <- numeric()
  
  # 3. Loop through every single file in the directory
  for (file_path in all_files) {
    # Read the current file
    current_file <- read.csv(file_path)
    
    # Filter out rows with missing data (NAs)
    complete_rows <- current_file[complete.cases(current_file), ]
    
    # 4. Check if the number of complete cases exceeds the threshold
    if (nrow(complete_rows) > threshold) {
      # Calculate correlation between sulfate and nitrate
      file_corr <- cor(complete_rows$sulfate, complete_rows$nitrate)
      
      # Append the result to our correlations vector
      correlations <- c(correlations, file_corr)
    }
  }
  
  # 5. Return the vector (will naturally be length 0 if no files met the threshold)
  return(correlations)
}