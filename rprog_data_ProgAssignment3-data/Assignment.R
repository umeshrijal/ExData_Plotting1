source("rankhospital.R")
source("rankhospital.R")

rankhospital("NC", "heart attack", "worst")
# Should return: "WAYNE MEMORIAL HOSPITAL"

rankhospital("WA", "heart attack", 7)

rankhospital("TX", "pneumonia", 10)

rankhospital("NY", "heart attack", 7)

r <- rankall("heart attack", 4)
as.character(subset(r, state == "HI")$hospital)

