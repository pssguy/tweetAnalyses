

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

#write_csv(tweets,"testTweets.csv")

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

output$weekdayChart <- renderPlotly({
  
  data()$tweets  %>% 
    mutate(wday=wday(timestamp, label = TRUE)) %>% 
    group_by(wday) %>% 
    tally() %>% 
    # ungroup() %>% 
    # group_by(year) %>% 
    plot_ly(x=wday,y=n,type="bar")%>%
    layout(hovermode = "closest",
           xaxis=list(title=" "),
           yaxis=list(title="Tweet Count")
    )
  
  
})

output$monthlyChart <- renderPlotly({
  
  data()$tweets   %>% 
    mutate(year=year(timestamp),month=month(timestamp, label = TRUE)) %>% 
    group_by(month,year) %>% 
    tally() %>% 
    ungroup() %>% 
    group_by(year) %>% 
    plot_ly(x=month,y=n,color=as.factor(year),colors = "Set1",mode="lines+markers") %>%
    layout(hovermode = "closest",
           xaxis=list(title=" "),
           yaxis=list(title="Tweet Count")
    )
  
  
})