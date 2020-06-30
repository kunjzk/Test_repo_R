# Code book for this project

This document contains details of the original dataset as well as the transformations performed on it.

## The original dataset

The dataset was downloaded from: [UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

It is a time-series dataset consisting of 561 Attributes, sensor measurements taken from the wrists of 30 subjects performing daily activities (walking, sitting down, and 4 others). The dataset was split into train and test sets, and records were split into attributes, IDs and labels in different txt files.

The 561 attributes consist of a variety (min, max, average, etc) of sensor measurements in each axis (X,Y,Z), and in different domains (time, frequency), normalized in the [-1,1] range. Full details of these features can be found in `README.txt` under `ass_4_dataset/`.

## Transformations performed

In Part 1:
* Records were joined by using the data.table `cbind` function
* Train and test sets were then stacked using dplyr `bind_rows` function to create `df_full`, the full dataset.

In Part 2:
* Regex matching was used to select columns that contained mean() and std() measurements from `df_full`
* Those selected columns, along with the first column (for the subject ID), as well as last column (for the activity ID) were then extracted from `df_full` to form a new dataframe, `mean_std_df`

In Part 3:
* A new column, `activity_name` was added to `mean_std_df`. This column contained the name of the activity performed by the subject, obtained by matching the activity ID (last column) to an existing map of activity IDs -> names (found in `activities.txt` under `ass_4_dataset/`)

In Part 4:
* Variables in `mean_std_df` were renamed according to the feature names given in the original dataset (found in `features.txt` under `ass_4_dataset/`)

In Part 5:
* All measurement variables were averaged for each activity performed by each subject. The new dataframe containing this information was named `averaged_df`.
