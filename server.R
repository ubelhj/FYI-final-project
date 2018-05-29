library(shiny)
library(ggplot2)
library(plotly)

source("global.R")


server <- function(input, output) {
  output$tempo_plot <- renderPlot(
    #ggplotly(
      ggplot(top_100_df, aes(tempo, danceability)) +
        geom_point(aes(color = cut(time_signature, breaks = 2), size = streams)) +
        geom_smooth(method = "lm", formula = y~x)
    #)
  )
  
}


shinyServer(server)
