# server.R
source("helpers.R")
counties <- readRDS("data/counties.rds")
library(maps)
library(mapproj)
shinyServer(
  function(input, output) {
    
    output$map <- renderPlot({
      switch (input$var,
        "Percent White" = percent_map(var=counties$white,color="blue3",legend.title = "percent white", max =input$range[[2]] ,min = input$range[[1]]), 
        "Percent Black" = percent_map(var=counties$black,color="blue3",legend.title = "percent black",max = input$range[[2]],min = input$range[[1]]),
        "Percent Hispanic" = percent_map(var=counties$hispanic,color="blue3",legend.title = "percent hispanic",max = input$range[[2]],min = input$range[[1]]),
        "Percent Asian" = percent_map(var=counties$asian,color="blue3",legend.title = "percent asian",max = input$range[[2]],min = input$range[[1]])
      )
    })
      
  }
)