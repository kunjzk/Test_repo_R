#data on housing for state of idaho

download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv", "q1data.csv", method = "curl")
#need to install package "data.table" and add it to library to use fread
DT = fread("q1data.csv")
all_cols = names(DT)
print(all_cols)
print("VAL" %in% all_cols)
#summary(DT)

#print(system.time(DT[,mean(pwgtp15),by=SEX]))

#DT[VAL==24, .N]