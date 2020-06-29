rankall <- function(outcome, num="best"){
  data <- read.csv("rprog_data_ProgAssignment3-data/outcome-of-care-measures.csv") 
  all_states <- sort(unique(data$State))
  
  outcome_data <- extract_outcome(outcome, data)

  hospitals = sapply(all_states, find_hospital, outcome_data, num)
  
  data.frame(hospital=hospitals, state=all_states)
}

extract_outcome <- function(outcome, data){
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
  suppressWarnings(data[, outcome_column] <- as.numeric(data[, outcome_column]))
  filtered_data <- data[complete.cases(data[, outcome_column]), c(hosp_name_column, state_column, outcome_column) ]
  invisible(filtered_data <- filtered_data[order(filtered_data[,2]), ])
}

find_hospital <- function (state, outcome_data, num){

  #find all entries from a state. then remove state from dataset.
  relevant_indices <- outcome_data$State==state
  state_subset <- outcome_data[relevant_indices,]
  
  state_subset <- state_subset[order(state_subset[,3], state_subset[,1]), ]
  
  if (num == "best"){
    num <- 1
  }
  else if(num=="worst"){
    num <- nrow(state_subset)
  }
  invisible(state_subset[num, 1])
  
}
