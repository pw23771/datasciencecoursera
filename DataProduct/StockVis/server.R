# server.R

library(quantmod)
library(downloader)
source("helpers.R")


shinyServer(function(input, output) {
        
        dataInput <- reactive({  
                getSymbols(input$symb, src = "google", 
                           from = input$dates[1],
                           to = input$dates[2],
                           auto.assign = FALSE)
        })
        
        StockPrice <- reactive({
                if (!input$adjust) return(dataInput())
                adjust(dataInput())
        })
        
        output$plot <- renderPlot({
                chartSeries(StockPrice(), theme = chartTheme("white"), 
                            type = "line", TA = c(addVo(),addBBands()))
        })
})