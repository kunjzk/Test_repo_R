complete <- function(directory, id=1:332){
  nobs <- integer(length(id))
  for (i in seq_along(id)){
    file_index <- sprintf("%03d", id[i])
    filename <- paste(directory,"/",file_index,".csv", sep="")
    data_file <- read.csv(filename)
    nobs[i] <- sum(complete.cases(data_file))
  }
  data.frame("id" = id, "nobs" = nobs)
}