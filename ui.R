


dashboardPage(
  skin = "green",title = "Tweet Analyses",
  dashboardHeader(title = "Tweet Analyses"),
  
  dashboardSidebar(
    includeCSS("custom.css"),
    includeMarkdown("about.md"),
inputPanel(
    textInput("handle", "Enter tweet handle", value="pssguy"),
    numericInput("offset","UTC Offset", value=-8,min=-11,max=12,  step=1),
    sliderInput("count","Max. number of tweets",min=20,max=3200,value=200,step=20,sep=''),
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
        fluidRow(
          column(
            width = 6,
            box( width = 12,
                 status = "success",solidHeader = TRUE,title = "Tweets per Month - Hover for details, click for tweets",
                 collapsible = T,collapsed = F,
                 plotlyOutput("monthlyChart")
            ),
            box( width = 12,
                 status = "success",solidHeader = TRUE,title = "Tweets by Weekday - Hover for details, click for tweets",
                 collapsible = T,collapsed = T,
                 plotlyOutput("weekdayChart")
            ),
        box( width = 12,
          status = "success",solidHeader = TRUE,title = "Tweets by Time of Day - Hover for details, click for tweets",
          collapsible = T,collapsed = T,
          plotlyOutput("hourlyChart")
        )
        
          ),
        column(
          width = 6,
          box( width = 12,
               status = "success",solidHeader = TRUE,title = "Tweets by Selected Month",
               collapsible = T,collapsed = F,
               DT::dataTableOutput("monthlyTable")
          ),
          box( width = 12,
               status = "success",solidHeader = TRUE,title = "Tweets by Selected Weekday",
               collapsible = T,collapsed = F,
               DT::dataTableOutput("weekdayTable")
          ),
          box( width = 12,
               status = "success",solidHeader = TRUE,title = "Tweets by Selected Hour",
               collapsible = T,collapsed = F,
               DT::dataTableOutput("hourlyTable")
          )
         
          
        )
        )
        
        
        
       
      
    )
  )
)
)
