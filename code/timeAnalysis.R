

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

tweets <- tweets %>% 
  mutate(hour=hour(timestamp),wday=wday(timestamp, label = TRUE),year=year(timestamp),month=month(timestamp, label = TRUE))
#print(glimpse(tweets))

#write_csv(tweets,"testTweets.csv")

info=list(tweets=tweets)

return(info)

})



output$hourlyChart <- renderPlotly({
  
  print("enter hourly chart")
  
  print(data()$tweets)
  
  df <- data()$tweets %>% 
 
    group_by(hour) %>% 
    tally() 
  
  print(glimpse(df))
  
    plot_ly(df,x=hour, y=n, type="bar", source="C",
            hoverinfo = "text",
            text = paste("Tweets:",n,"<br>Hr from:",hour)) %>%
    layout(hovermode = "closest",
           xaxis=list(title="24-hour Clock"),
           yaxis=list(title="Tweet Count")
           
    ) 
  
  
})

output$weekdayChart <- renderPlotly({
  
  data()$tweets  %>% 
 
    group_by(wday) %>% 
    tally() %>% 
    
    plot_ly(x=wday,y=n,type="bar",source="B")%>%
    layout(hovermode = "closest",
           xaxis=list(title=" "),
           yaxis=list(title="Tweet Count")
    )
  
  
})

output$monthlyChart <- renderPlotly({
  
  data()$tweets   %>% 

    group_by(month,year) %>% 
    tally() %>% 
    ungroup() %>% 
    group_by(year) %>% 
    plot_ly(x=month,y=n,color=as.factor(year),colors = "Set1",mode="lines+markers",source="A") %>%
    layout(hovermode = "closest",
           xaxis=list(title=" "),
           yaxis=list(title="Tweet Count")
    )
  
  
})

### blogs say by hour - bit of issue with source

output$hourlyTable <- DT::renderDataTable({
  if(is.null(event_data("plotly_click"))) return()

  s <- event_data("plotly_click", source="C")
  if (length(s)==0) return()
  
  hrChoice=s[["x"]]
  print(hrChoice)
  
  data()$tweets %>% 
    ungroup() %>% 
    filter(hour==hrChoice) %>% 
    arrange(desc(created)) %>% 
    select(text,created_UTC=created,favorites=favoriteCount,retweets=retweetCount) %>%
    
  DT::datatable(class='compact stripe hover row-border order-column',rownames=FALSE,options= list(paging = TRUE, searching = FALSE,info=FALSE))
  
})


output$weekdayTable <- DT::renderDataTable({
  if(is.null(event_data("plotly_click"))) return()
  
  s <- event_data("plotly_click", source="B")
  if (length(s)==0) return()
  
  print(s)
  
  wdayChoice=s[["x"]]
  
  
  data()$tweets %>% 
    ungroup() %>% 
    filter(wday==wdayChoice) %>% 
    arrange(desc(created)) %>% 
    select(text,created_UTC=created,favorites=favoriteCount,retweets=retweetCount) %>%
    
    DT::datatable(class='compact stripe hover row-border order-column',rownames=FALSE,options= list(paging = TRUE, searching = FALSE,info=FALSE))
  
})

output$monthlyTable <- DT::renderDataTable({
  if(is.null(event_data("plotly_click"))) return()
  
  s <- event_data("plotly_click", source="A")
  if (length(s)==0) return()
  
  print("s")
  print(s)
  
  monthChoice=s[["x"]]
  yearChoice=2016-s[["curveNumber"]]
  
  print(monthChoice)
  print(yearChoice)
  
  
  data()$tweets %>% 
    ungroup() %>% 
    filter(year==yearChoice&month==monthChoice) %>% 
    arrange(desc(created)) %>% 
    select(text,created_UTC=created,favorites=favoriteCount,retweets=retweetCount) %>%
    
    DT::datatable(class='compact stripe hover row-border order-column',rownames=FALSE,options= list(paging = TRUE, searching = FALSE,info=FALSE))
  
})