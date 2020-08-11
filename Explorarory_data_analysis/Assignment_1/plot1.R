library(data.table)
library(dplyr)
# Read data
df <- fread("data/household_power_consumption.txt", na.strings ="?")

#Clean data
df <- df[complete.cases(df), c("Date", "Time", "Global_active_power")]
df$Date <- as.Date(df$Date, format= "%d/%m/%Y")

#Filter data
df <- df[df$Date>="2007-02-01" & df$Date<="2007-02-02",]
print(head(df))

#Plot Histogram of Global Active Power
hist(df$Global_active_power, xlab="Global Active Power(kilowatts)", main="Global Active Power", col="red")
dev.copy(png, file="figure/plot1.png")
dev.off()