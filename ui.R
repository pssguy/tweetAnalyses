


dashboardPage(
  skin = "green",
  dashboardHeader(title = "Tweet Analyses"),
  
  dashboardSidebar(
    includeCSS("custom.css"),
inputPanel(
    textInput("handle", "Enter tweet handle", value="pssguy"),
    actionButton("go","Get Data")
),
    hr(),
    
    sidebarMenu(
      id = "sbMenu",
      
      menuItem(
        "Time", tabName = "tweeter",icon = icon("line-chart"), selected=T
      ),
     

tags$hr(),
menuItem(text="",href="https://mytinyshinys.shinyapps.io/dashboard",badgeLabel = "All Dashboards and Trelliscopes (14)"),
tags$hr(),

tags$body(
  a(class="addpad",href="https://twitter.com/pssGuy", target="_blank",img(src="images/twitterImage25pc.jpg")),
  a(class="addpad2",href="mailto:agcur@rogers.com", img(src="images/email25pc.jpg")),
  a(class="addpad2",href="https://github.com/pssguy",target="_blank",img(src="images/GitHub-Mark30px.png")),
  a(href="https://rpubs.com/pssguy",target="_blank",img(src="images/RPubs25px.png"))
)
    )
  ),
  
  dashboardBody(
    tabItems(
      tabItem(
        "tweeter",
        box(
          status = "success",solidHeader = TRUE,title = "Tweets by Time of Day",
          collapsible = T,collapsed = F,
        plotlyOutput("hourlyChart")
        )
        
        
        
       
      
    )
  )
)
)