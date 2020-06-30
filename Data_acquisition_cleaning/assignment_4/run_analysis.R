source("ass_4_functions.R")

#1: Merge datasets
df_full <- read_and_merge_data()

#2: Extract mean and std measurements
all_features <- fread("ass_4_dataset/features.txt", col.names=c("index", "feature_name"))
mean_std_indices <- get_mean_std_indices(all_features)
indices_with_offset <- mean_std_indices + 1
indices_to_use <- c(1, indices_with_offset, length(names(df_full))) #first, last and all relevant indices
mean_std_df <- df_full %>% select(all_of(indices_to_use))

#3: Name activities in dataset
activities <- fread("ass_4_dataset/activity_labels.txt", col.names=c("index", "activity"))
mean_std_df <- mean_std_df %>% mutate(activity_name = activities[V1...563, activity])

#4: Rename columns
feature_names <- all_features[mean_std_indices, feature_name]
correct_colnames <- c("subject_ID", feature_names, "activity_ID", "activity_name")
mean_std_df <- mean_std_df %>% rename_at(names(mean_std_df), function(x) correct_colnames)

#5: Average each variable across activities and subjects
averaged_df <- mean_std_df %>% group_by(subject_ID, activity_ID) %>% summarize_at(feature_names,mean)
write.table(averaged_df,"final_df.txt",row.names=FALSE)