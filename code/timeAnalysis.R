

## Initially get max available all types

print("enter timeanalysis code")

data <- eventReactive(input$go,{

  print("enter reactive")
  req(input$handle)
  print(input$handle)
maxTweets <- userTimeline(input$handle, n=input$count, excludeReplies=FALSE, includeRts=TRUE )

tweets <- twListToDF(maxTweets)

tz <- timeZone[timeZone$UTC_Offset==input$offset,]$Location
print(tz)

tweets$timestamp <- ymd_hms(tweets$created)
tweets$timestamp <- with_tz(tweets$created, tz)
#print(glimpse(tweets))
info=list(tweets=tweets)

return(info)

})



output$hourlyChart <- renderPlotly({
  
  print("enter hourly chart")
  
  print(data()$tweets)
  
  df <- data()$tweets %>% 
    mutate(hour=hour(timestamp)) %>% 
    group_by(hour) %>% 
    tally() 
  
  print(glimpse(df))
  
    plot_ly(df,x=hour, y=n, type="bar",
            hoverinfo = "text",
            text = paste("Tweets:",n,"<br>Hr from:",hour)) %>%
    layout(hovermode = "closest",
           xaxis=list(title="24-hour Clock"),
           yaxis=list(title="Tweet Count")
           
    ) 
  
  
})

