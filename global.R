library(dplyr)
# library(leaflet)
# library(readxl)
# library(ggmap)
library(shiny)
library(shinydashboard)
# library(choroplethr)
# library(rgdal)
library(stringr)
# library(RColorBrewer)
# library(rcstatebin)
 library(readr)

library(ggvis)
library(ggplot2)
library(lubridate)


library(htmlwidgets)
library(DT)


library(plotly)
library(twitteR)
library(base64enc)

##OUauth
# setup_twitter_oauth(consumer_key="xxx", consumer_secret="xxx",
#                     access_token="xxx", access_secret="xxx")


# [1] "Using direct authentication"


## not sure required
options(RCurlOptions = list(cainfo = system.file("CurlSSL", "cacert.pem", package = "RCurl")))

# from http://www.r-bloggers.com/how-to-create-a-twitter-sentiment-analysis-using-r-and-shiny/
token <- get("oauth_token", twitteR:::oauth_cache) #Save the credentials info
token$cache()

## offsets

timeZone <- read_csv("timeOffsets.csv")

