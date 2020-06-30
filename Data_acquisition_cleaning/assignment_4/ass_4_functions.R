library(data.table)
library(dplyr)

read_and_merge_data <- function(){
  x_train_path <- "ass_4_dataset/train/X_train.txt"
  y_train_path <- "ass_4_dataset/train/y_train.txt"
  subject_train_path <- "ass_4_dataset/train/subject_train.txt"
  x_train_df <- fread(x_train_path) #591 features
  y_train_df <- fread(y_train_path) #labels
  subj_train_df <- fread(subject_train_path) #subject ID
  train_full <- cbind(subj_train_df, x_train_df, y_train_df)
  rm(x_train_df, y_train_df, subj_train_df)
  
  #test set
  x_test_path <- "ass_4_dataset/test/X_test.txt"
  y_test_path <- "ass_4_dataset/test/y_test.txt"
  subject_test_path <- "ass_4_dataset/test/subject_test.txt"
  x_test_df <- fread(x_test_path) #591 features
  y_test_df <- fread(y_test_path) #labels
  subj_test_df <- fread(subject_test_path) #subject ID
  test_full <- cbind(subj_test_df, x_test_df, y_test_df)
  rm(x_test_df, y_test_df, subj_test_df)
  
  # merge both
  merged <- bind_rows(train_full, test_full)
}

get_mean_std_indices <- function(all_features){
  mean_indices <- grep("\\bmean()\\b", all_features$feature_name)
  std_indices <- grep("\\bstd()\\b", all_features$feature_name)
  all_indices <- sort(union(mean_indices, std_indices))
}