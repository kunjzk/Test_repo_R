## Question 1
# library(data.table)
# idahodata <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
# idahopath <- "idaho.csv"
# if(!file.exists(idahopath)){
#   download.file(idahodata, idahopath, method="curl")
# }
# idahodata <- fread(idahopath)
# print(head(idahodata))
# print(strsplit(names(idahodata), "wgtp")[123])

## Question 2
# library(data.table)
# gdp <- fread(gdppath, skip=5, select=c(1,2,4,5), nrows=190, col.names=c("CountryCode", "Rank", "Economy", "GDP"))
# print(mean(as.numeric(gsub(",","",gdp$GDP))))

## Question 3
# gdp <- fread(gdppath, skip=5, select=c(1,2,4,5), nrows=190, col.names=c("CountryCode", "Rank", "Economy", "GDP"))
# countryNames <- gdp$Economy
# print(grep("^United", countryNames))

## Question 4
# library(data.table)
# educationpath<-"q3education.csv"
# gdp <- fread(gdppath, skip=5, select=c(1,2,4,5), nrows=190, col.names=c("CountryCode", "Rank", "Economy", "GDP"))
# education <- fread(educationpath)
# merged <- merge(education, gdp)
# print(merged[grep("Fiscal year end: June", merged$`Special Notes`),])

## Question 5
library(quantmod)
library(lubridate)
amzn = getSymbols("AMZN",auto.assign=FALSE)
sampleTimes = index(amzn)
#print(amzn)

date <- ymd(sampleTimes)
amzn$wkdys <- wday(date)
filtered<-amzn[grep("^2012",sampleTimes),]
print(nrow(filtered[filtered$wkdys==2,]))
