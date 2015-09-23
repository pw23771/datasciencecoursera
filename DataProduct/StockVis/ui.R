library(shiny)

shinyUI(fluidPage(
  titlePanel("stockVis"),
  
  sidebarLayout(
    sidebarPanel(
      helpText("Select a stock to examine. 
        Information will be collected from google finance."),
    
      textInput("symb", "Symbol", "GOOG"),
    
      dateRangeInput("dates", 
        "Date range",
        start = "2013-01-01", 
        end = as.character(Sys.Date())),
      
      br(),
      br(),
      
      
      checkboxInput("adjust", 
        "Adjust prices for inflation", value = FALSE)
    ),
    
    mainPanel(plotOutput("plot"))
  )
))