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

##OUauth
setup_twitter_oauth(consumer_key="U8LcUI7RtjBjawsNGqH7Hw", consumer_secret="w2056aWoxQjrvW5YFi61F3XIFeyyOnndA4ICd6piQ4Q", 
                    access_token="197097700-VgIy0Sq15YpbDyxKAqlKbnzLTOFJ3KrYrDTsWb1x", access_secret="EcYzUKBfoGUUS9VWAEEqiBtRKOKJN0IVzEsBCggM4")

## not sure required
options(RCurlOptions = list(cainfo = system.file("CurlSSL", "cacert.pem", package = "RCurl")))