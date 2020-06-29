best <- function(state, outcome){
  # useful variables
  state_column <- 7
  hosp_name_column <- 2

  # read data, if the specified column name is valid
  if (outcome == "heart attack"){
    outcome_column <- 11
  }
  else if (outcome == "heart failure"){
    outcome_column <- 17
  }
  else if (outcome == "pneumonia"){
    outcome_column <- 23
  }
  else{
    stop("invalid outcome")
  }
  
  # remove NAs from column of interest, remove unneccessary columns
  data <- read.csv("rprog_data_ProgAssignment3-data/outcome-of-care-measures.csv")
  suppressWarnings(data[, outcome_column] <- as.numeric(data[, outcome_column]))
  filtered_data <- data[complete.cases(data[, outcome_column]), c(hosp_name_column, state_column, outcome_column) ]
  rm(data)
  
  # read data on the specified state, if the name is valid
  if(! state %in% filtered_data$State){
    stop("invalid state")
  }
  filtered_data <- filtered_data[filtered_data$State == state, ]
  
  # Return all hospital names with minimum mortality
  min_mortality <- min(filtered_data[,3])
  filtered_data[filtered_data[,3]==min_mortality, ]$Hospital.Name
  }