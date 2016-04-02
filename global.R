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
# library(readr)

library(ggvis)
library(ggplot2)
library(lubridate)


library(htmlwidgets)
library(DT)


library(plotly)
library(twitteR)
library(base64enc)

##OUauth
setup_twitter_oauth(consumer_key="U8LcUI7RtjBjawsNGqH7Hw", consumer_secret="w2056aWoxQjrvW5YFi61F3XIFeyyOnndA4ICd6piQ4Q",
                    access_token="197097700-VgIy0Sq15YpbDyxKAqlKbnzLTOFJ3KrYrDTsWb1x", access_secret="EcYzUKBfoGUUS9VWAEEqiBtRKOKJN0IVzEsBCggM4")
# [1] "Using direct authentication"
print("gap1")
#setup_twitter_oauth(consumer_key="U8LcUI7RtjBjawsNGqH7Hw", consumer_secret="w2056aWoxQjrvW5YFi61F3XIFeyyOnndA4ICd6piQ4Q")
# [1] "Using browser based authentication"
# Error in init_oauth1.0(self$endpoint, self$app, permission = self$params$permission,  :
#                          Unauthorized (HTTP 401).


## not sure required
options(RCurlOptions = list(cainfo = system.file("CurlSSL", "cacert.pem", package = "RCurl")))

# from http://www.r-bloggers.com/how-to-create-a-twitter-sentiment-analysis-using-r-and-shiny/
token <- get("oauth_token", twitteR:::oauth_cache) #Save the credentials info
token$cache()

