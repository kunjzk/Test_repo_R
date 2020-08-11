library(data.table)
library(dplyr)
# Read data
df <- fread("data/household_power_consumption.txt", na.strings ="?")
#Clean data
df <- df[complete.cases(df), c("Date", "Time", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3", "Voltage", "Global_active_power", "Global_reactive_power")]
df$Date <- as.Date(df$Date, format= "%d/%m/%Y")
df$DateTime <- as.POSIXct(paste(df$Date, df$Time))

#Filter data
df <- df[df$Date>="2007-02-01" & df$Date<="2007-02-02",]

#Set Up Subplots
par(mfrow=c(2,2))

#First subplot
with(df, plot(Global_active_power ~ DateTime,type="l", ylab="Global Active Power", xlab=""))

#Second subplot
with(df, plot(Voltage ~ DateTime,type="l", ylab="Voltage", xlab=""))

#Third Subplot
plot(df$Sub_metering_1 ~ df$DateTime,type="l", col="black",xlab="", ylab="Energy Sub Metering")
lines(df$Sub_metering_2 ~ df$DateTime,type="l", col="red")
lines(df$Sub_metering_3 ~ df$DateTime,type="l", col="blue")
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"), lty=1, cex=0.8)

#Last subplot
with(df, plot(Global_reactive_power ~ DateTime,type="l", ylab="Global_reactive_power", xlab=""))

dev.copy(png, width=480, height=480, units="px", file="figure/plot4.png")
dev.off()