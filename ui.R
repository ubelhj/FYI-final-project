source("global.R")

ui <- navbarPage("Exploring Music", 
        tabPanel("Home", 
          sidebarLayout(position = "right",
            sidebarPanel(
              h3(strong("Source:")),
              p(em("Exploring Music was possible thanks to Spotify's Web API")),
              a("Spotify Web API",
                href = 'https://beta.developer.spotify.com/documentation/web-api/')
            ),
            mainPanel(
              h1(strong("Introduction:")),
              p(em("Exploring Music"), "utilitizes the Spotify Web API. The API endpoints
                return JSON metadata about music artists, albums, BPM,
                and tracks, directly from the Spotify Data Catalogue.
                It also provides user-related data like playlists and
                music that the user saves in the Your Music library."),
              p("From this information, our group decided to explore various
                questions regarding music. Our project allows our users to
                investigate broadly such as genre popularity and album information
                to more technical aspect of songs such as danceability vs. energy
                and if songs are more relatively positive and negative."),
              p(strong("Project Presented By: Team AD3 - FYI (For Your Informatics)"))            )
          )
        ),
        tabPanel("Audio Traits",
          sidebarLayout(
            sidebarPanel(
              h4(strong("Directions")),
              p("Select two audio traits to display"),
              selectInput(
                inputId = "audio_one",
                label = "First Audio Traits",
                choices = c(colnames(column_names_james))
              ),
              selectInput(
                inputId = "audio_two",
                label = "Second Audio Traits",
                choices = c(colnames(column_names_james))
              ),
              h4(strong("Definitions:")),
              p(htmlOutput("definition_one")),
              p(htmlOutput("definition_two"))
            ),
            mainPanel(
              h2("Audio Traits of the Top 100 Songs"),
              p(htmlOutput("statement_one")),
              tabsetPanel(type = "tabs",
                          tabPanel("Visual", 
                                   p("  "),
                                   plotlyOutput("plot"),
                                   htmlOutput("features_click"),
                                   textOutput("features_analysis")),
                          tabPanel("Table", 
                                   p("  "),
                                   DT::dataTableOutput("table_one")),
                          tabPanel("Summary", 
                                   p("  "),
                                   DT::dataTableOutput("summary"))
              )
            )
          )
        ),
        tabPanel("Map",
          sidebarLayout(
            sidebarPanel(
              p("temp")
            ),
            mainPanel(
             p("temp")
            )
          )
        ),
        tabPanel("Random",
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
              tabPanel("About the Project",
                h2(strong("Project Description")),
                h4(strong("What is the data?")),
                HTML("The data utilizes Spotify's Web API. The API endpoints
                     <br>return JSON metadata about music artists, albums, BPM,
                     <br>and tracks, directly from the Spotify Data Catalogue."),
                h4(strong("Why do we care?")),
                HTML("Our project allows our users to
                     <br>investigate broadly such as genre popularity and album information
                     <br>to more technical aspect of songs such as danceability vs. energy
                     <br>and if songs are more relatively positive and negative."),
                h2(strong("Technical Description")),
                h4(strong("What libraries were used?")),
                HTML("<li> DT - R interface to the JavaScript library DataTables. </li> 
                     <li> httr - Tools for working with HTTP organised by HTTP verbs. </li>
                     <li> jsonlite - JSON parser and generator optimized for
                     statistical data and the web. </li>
                     <li> dplyr - A fast, consistent tool for working with data frame
                     like objects, both in memory and out of memory. </li>
                     <li> Shiny - Package that makes it easy to build interactive web
                     apps straight from R. </li>
                     <li> ggplot2 - Data visualization package for R. </li>
                     <li> Plotly - Library makes interactive, publication-quality 
                     graphs with R. </li>"),
                h4(strong("Sources")),
                HTML("<li> Stack Overflow </li> 
                     <li> Plotly Documentation. </li>")
              ),
              tabPanel("About the Team",
                h3(strong("Project Presented By: Team AD3 - FYI (For Your Informatics)")),
                h3("Members: James Kim, Joe Ubelhart, Timmy Tang, Owen DeArmond-MacLeod"),
                h3("Biography:"),
                h5(strong("James Kim:")),
                p("Hello! I like to code."),
                h5(strong("Joe Ubelhart:")),
                p(""),
                h5(strong("Timmy Tang:")),
                p(""),
                h5(strong("Owen DeArmond-MacLeod:")),
                p("I'm Owen DeArmond-MacLeod, a Poly Sci major who has an interest
                  in informatics and statistics")
              )
            )    
          )
        )
      )


shinyUI(ui)