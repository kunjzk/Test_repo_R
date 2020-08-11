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

#Create Weekday Label
df$DateTime <- as.POSIXct(paste(df$Date, df$Time))
print(head(df))


#Plot Histogram of Global Active Power
with(df, plot(Global_active_power ~ DateTime,type="l", ylab="Global Active Power(kilowatts)", xlab=""))
dev.copy(png, width=480, height=480, units="px", file="figure/plot2.png")
dev.off()