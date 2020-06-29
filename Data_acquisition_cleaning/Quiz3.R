# Question 1
# library(dplyr)
#download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv", "q3data.csv", method="curl")
# data <- read.csv("q3data.csv")
# needed<-complete.cases(data$ACR, data$AGS)
# new_data<-mutate(data, agricultureLogical = (ACR==3 & AGS == 6) )
# print(which(new_data$agricultureLogical))


# Question 2
# library(jpeg)
# download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg", "q3_img", mode="wb")
# img <- readJPEG("q3_img", native=TRUE)
# file.remove("q3_img")
# print(quantile(img, probs=c(0.3, 0.8)))


# Question 3 --HOW DO I USE PIPE?????----
library(dplyr)
library(data.table)
gdpurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
gdppath <- "q3gdp.csv"
educationurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
educationpath <- "q3education.csv"

download.file(gdpurl, gdppath, method="curl")
download.file(educationurl, educationpath, method="curl")

gdp <- fread(gdppath, skip=5, select=c(1,2,4,5), nrows=190, col.names=c("CountryCode", "Rank", "Economy", "GDP"))
education <- fread(educationpath)
print(gdp)
merged <- merge(gdp, education, by="CountryCode") %>% arrange(desc(Rank))
print(merged[13, "CountryCode"])
print(nrow(merged))
# Question 4
# library(dplyr)
# gdp <- read.csv(url("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"))
# education <- read.csv(url("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"))
# education_new <- left_join(education, gdp, by=c("CountryCode" = "X"))
# ed_grouped <- group_by(education_new, Income.Group)
# ed_grouped <- na_if(ed_grouped, "")
# ed_grouped <- ed_grouped[complete.cases(ed_grouped$Gross.domestic.product.2012), ]
# ed_grouped <- select(ed_grouped, Income.Group, Gross.domestic.product.2012)
# print(head(ed_grouped))
# print(summarise(ed_grouped, avg = mean(as.numeric(Gross.domestic.product.2012))))

# Question 5
# library(dplyr)
# gdp <- read.csv(url("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"))
# education <- read.csv(url("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"))
# df <- left_join(education, gdp, by=c("CountryCode" = "X")) 
# df <- select(df, Gross.domestic.product.2012, Income.Group, CountryCode)
# df <- na_if(df, "")
# df <- na.omit(df)
# df$GDPquantiles <- ntile(as.numeric(df$Gross.domestic.product.2012), 5)
# df_grouped <- group_by(df, GDPquantiles)
# print(count(df_grouped, Income.Group))



