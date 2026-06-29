complete <- function(directory, id = 1:332) {
  all_files <- list.files(directory, full.names = TRUE)
  
  file_names <- numeric(length(id))
  nobs <- numeric(length(id))
  
  for (i in seq_along(id)) {
    current_file <- read.csv(all_files[id[i]])
    file_names[i] <- id[i]
    nobs[i] <- sum(complete.cases(current_file))
  }
  
  result <- data.frame(id = file_names, nobs = nobs)
  return(result)
}