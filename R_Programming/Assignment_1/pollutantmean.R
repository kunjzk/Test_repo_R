pollutantmean <- function(directory, pollutant, id = 1:332){
  count <- 0
  total_sum <- 0
  for (i in id){
    file_index <- sprintf("%03d", i)
    filename <- paste(directory,"/",file_index,".csv", sep="")
    data_file <- read.csv(filename)
    valid_entries <- !is.na(data_file[pollutant])
    count <- count + sum(valid_entries)
    total_sum <- total_sum + sum(data_file[pollutant][valid_entries])
  }
  total_sum/count
}