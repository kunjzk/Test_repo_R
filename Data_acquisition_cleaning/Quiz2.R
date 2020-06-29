# --Question 1--

# library(httr)
# library(rjson)
# oauth_endpoints("github")
# myapp <- oauth_app("github", key = "Iv1.06e5c5139e43fce5" , secret = "0f6e7d39f08390713f36f86c462ebb9fe661e030")
# github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)
# gtoken <- config(token = github_token)
# req <- GET("https://api.github.com/users/jtleek/repos")
# stop_for_status(req)
# json2 = jsonlite::fromJSON(toJSON(content(req)))
# print(json2[json2$name=="datasharing", ]$created_at)

# --Question 2--
# library(sqldf)
# acs <- read.csv("q1data.csv")
#print(sqldf("select pwgtp1 from acs where AGEP<50"))

# --Question 3-- 
# use the same dataframe as above
# print(sqldf("select AGEP wehere unique from acs"))

# --Question 4--
# library(XML)
# url <- "http://biostat.jhsph.edu/~jleek/contact.html"
# htmlCode <- readLines(url)
#  
# lines <- c(10, 20, 30, 100)
# for (line in lines) {
#   print(nchar(htmlCode[line]))
# }

# --Question 5--
library(readr)
x <- read.fwf(file="https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for",
              skip=4,
              widths=c(14, 4, 9, 5, 8, 4, 4))
print(sum(x[,4]))



 