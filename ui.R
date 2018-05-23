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
        ),
        tabPanel("About",
          splitLayout(
            tabsetPanel(type = "tabs", 
              tabPanel("About the Data Set",
              h3(strong("sss")),  
              p("ssssssssssssss")
              ),
              tabPanel("About the Team",
                h3(strong("Project Presented By: Team AD3 - FYI (For Your Informatics)")),
                h3("Members: James Kim, Joe Ubelhart, Timmy Tang, Owen DeArmond-MacLeod"),
                h3("Biography:"),
                h5(strong("James Kim:")),
                h5(strong("Joe Ubelhart:")),
                h5(strong("Timmy Tang:")),
                h5(strong("Owen DeArmond-MacLeod:"))
              )
            )    
          )
        )
      )

shinyUI(ui)
