library(shiny)

source("global.R")
source("server.R")

ui <- navbarPage("Spotify API (Temporary Name)", 
        tabPanel("Home", 
          sidebarLayout(
            sidebarPanel(
              p("temp")
            ),
            mainPanel(
              p("temp")
            )
          )
        ),
        tabPanel("Page 1",
          sidebarLayout(
            sidebarPanel(
              p("temp")
            ),
            mainPanel(
              p("temp")
            )
          )
        ),
        tabPanel("Page 2",
                 sidebarLayout(
                   sidebarPanel(
                     p("temp")
                   ),
                   mainPanel(
                     p("temp")
                   )
                 )
        ),
        tabPanel("Page 3",
                 sidebarLayout(
                   sidebarPanel(
                     p("temp")
                   ),
                   mainPanel(
                     p("temp")
                   )
                 )
        ),
        tabPanel("Page 4",
                 sidebarLayout(
                   sidebarPanel(
                     p("temp")
                   ),
                   mainPanel(
                     p("temp")
                   )
                 )
        )
  
)

shinyUI(ui)
