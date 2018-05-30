source("global.R")

ui <- navbarPage("Exploring Music Through Spotify", 
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
                                          p("Exploring Music utilitizes the Spotify Web API. The API endpoints
                                            return JSON metadata about music artists, albums, BPM,
                                            and tracks, directly from the Spotify Data Catalogue.
                                            It also provides user-related data like playlists and
                                            music that the user saves in the Your Music library."),
                                          p("From this information, our group decided to explore various
                                            questions regarding music. Our project allows our users to
                                            investigate genre popularity and album information to more
                                            technical aspect of songs such as time signature vs. BPM and if
                                            songs are more relatively positive and negative."),
                                          p("Project Presented By: Team AD3 - FYI (For Your Informatics)")
                                          )
                                          )
                                        ),
                 tabPanel("correlation/hypthesis testing",
                          sidebarLayout(
                            sidebarPanel(
                              h4(strong("Directions")),
                              p("Select two audio traits to display"),
                              selectInput(
                                inputId = "audio_one",
                                label = "First Audio Traits",
                                choices = c("Danceability", "Energy", "Key", "Loudness", "Speechiness", "Acousticness",
                                            "Instrumentalness", "Liveness", "Valence", "Tempo", "Time Signature")
                              ),
                              selectInput(
                                inputId = "audio_two",
                                label = "Second Audio Traits",
                                choices = c("Danceability", "Energy", "Key", "Loudness", "Speechiness", "Acousticness",
                                            "Instrumentalness", "Liveness", "Valence", "Tempo", "Time Signature")
                              ),
                              h4(strong("Definitions:")),
                              p(htmlOutput("definition_one")),
                              p(htmlOutput("definition_two"))
                            ),
                            mainPanel(
                              tabsetPanel(type = "tabs",
                                          tabPanel("Visual"),
                                          tabPanel("Table", DT::dataTableOutput("table_one")),
                                          tabPanel("Summary")
                              ),
                              p(htmlOutput("statement_one"))
                            )
                          )
                 ),
                 tabPanel("Chloropleth Map",
                          sidebarLayout(
                            sidebarPanel(
                              p("Click on a teal colored country to see that country's top 5 songs"),
                              selectInput("countries", label = "country", data_has$region %>% unique(), selected = NULL, multiple = FALSE,
                                          selectize = TRUE, width = NULL, size = NULL),
                              tableOutput("top10table")
                            ),
                            mainPanel(
                              plotOutput("plot", click = "plot_click")
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
                                                 p("ssssssssssssss"),
                                                 h4(strong("Why do we care?")),
                                                 p("aaaa"),
                                                 h2(strong("Technical Description")),
                                                 h4(strong("What libraries were used?")),
                                                 p("jjj")
                                        ),
                                        tabPanel("About the Team",
                                                 h3(strong("Project Presented By: Team AD3 - FYI (For Your Informatics)")),
                                                 h3("Members: James Kim, Joe Ubelhart, Timmy Tang, Owen DeArmond-MacLeod"),
                                                 h3("Biography:"),
                                                 h5(strong("James Kim:")),
                                                 p("Hello!"),
                                                 h5(strong("Joe Ubelhart:")),
                                                 h5(strong("Timmy Tang:")),
                                                 h5(strong("Owen DeArmond-MacLeod:")),
                                                 p("I'm Owen DeArmond-MacLeod, a Poly Sci major who has an interest
                                                   in informatics and statistics")
                                                 )
                                        )    
                            )
                          )
                 )


shinyUI(ui)