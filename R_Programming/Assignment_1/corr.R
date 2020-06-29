corr <- function(directory, threshold = 0){
  total_files <- length(list.files(directory,pattern="*.csv"))
  cases_status <- complete(directory, 1:total_files)
  use_cases <- cases_status$nobs > threshold
  if(sum(use_cases)==0){
    x <- vector(mode = "numeric", length=0L)
  }
  else{
    x <- vector("numeric", length = sum(use_cases))
    indices_to_use <- cases_status[use_cases, ][["id"]]
    for (i in seq_along(indices_to_use)){
      file_index <- sprintf("%03d", indices_to_use[i])
      filename <- paste(directory,"/",file_index,".csv", sep="")
      data_file <- read.csv(filename)
      x[i] <- cor(data_file$nitrate,data_file$sulfate,use="pairwise.complete.obs")
    }
  }
  x
}


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