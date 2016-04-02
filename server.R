
shinyServer(function(input, output, session) {
  
  print("enter server")
  source("code/timeAnalysis.R", local = TRUE)
  
})
