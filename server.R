library(shiny)
library(ggplot2)
library(plotly)

source("global.R")


server <- function(input, output) {
## James's Server Portion
## Reactive Functions
  audio_one <- reactive({
    input$audio_one
  })
  audio_two <- reactive({
    input$audio_two
  })
## Statement
  output$statement_one <- renderText({
    paste0("The data used are for the traits: ",
           audio_one(), " and ", audio_two()
    )
  })
## Output for Data Table
  output$table_one <- DT::renderDataTable(DT::datatable({
    top_100_df_james %>% select("Track Name", "Artist", audio_one(), audio_two())
  }))
    
## Joe's Server Portion

## Owen's Server Portion

## Timmy's Server Portion
  
  
  
    
}


shinyServer(server)
