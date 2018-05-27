library(shiny)

source("global.R")
source("server.R")

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
              p("Exploring Music utilitizes the Spotify Web API. The API endpoints
                return JSON metadata about music artists, albums, BPM,
                and tracks, directly from the Spotify Data Catalogue.
                It also provides user-related data like playlists and
                music that the user saves in the Your Music library."),
              p("From this information, our group decided to explore various
                questions regarding music. Our project allows our users to
                investigate genre popularity and album information to more
                technical aspect of songs such as time signature vs. BPM and if
                songs are more relatively positive and negative.")
            )
          )
        ),
        tabPanel("correlation/hypthesis testing",
          sidebarLayout(
            sidebarPanel(
              selectInput(
                inputId = "audio_one",
                label = "Choose First Audio Traits",
                choices = c("Danceability", "Energy", "Key", "Loudness", "Speechiness", "Acousticness",
                            "Instrumentalness", "Liveness", "Valence", "Tempo", "Time Signature")
              ),
              selectInput(
                inputId = "audio_two",
                label = "Choose Second Audio Traits",
                choices = c("Danceability", "Energy", "Key", "Loudness", "Speechiness", "Acousticness",
                            "Instrumentalness", "Liveness", "Valence", "Tempo", "Time Signature")
              ),
              h3("Definitions:"),
              p(strong("Danceability:"), "How suitable a track is for dancing based on a
                combination of musical elements including tempo, rhythm stability,
                beat strength, and overall regularity. A value of 0.0 is least
                danceable and 1.0 is most danceable."),
              p(strong("Energy:"), "	Measure from 0.0 to 1.0 and represents a perceptual
                measure of intensity and activity. Typically, energetic tracks feel fast,
                loud, and noisy."),
              p(strong("Key:"), "The key the track is in. Integers map to pitches using 
                standard", a("Pitch Class notation",
                     href = 'https://en.wikipedia.org/wiki/Pitch_class')),
              p(strong("Loudness:"), "Quality of a sound that is the primary psychological
                correlate of physical strength (amplitude) measured in decibels(dB).
                Values typical range between -60 and 0 db."),
              p(strong("Speechiness:"), 	"Speechiness detects the presence of spoken words
                in a track. The more exclusively speech-like the recording the closer to 1.0
                the attribute value. Values between 0.33 and 0.66 describe tracks that may
                contain both music and speech, either in sections or layered, including
                such cases as rap music."),
              p(strong("Acousticness:"), "A confidence measure from 0.0 to 1.0 of whether
                the track is acoustic. 1.0 represents high confidence the track is acoustic."),
              p(strong("Instrumentalness:"), "Predicts whether a track contains no vocals. 
                The closer the instrumentalness value is to 1.0, the greater likelihood the
                track contains no vocal content."),
              p(strong("Liveness:"), "Detects the presence of an audience in the recording. 
                Higher liveness values represent an increased probability that the track was
                performed live. "),
              p(strong("Valence:")),
              p(strong("Tempo:")),
              p(strong("Time Signature:"))
            ),
            mainPanel(
              tabsetPanel(type = "tabs",
                          tabPanel("Visual"),
                          tabPanel("Table", DT::dataTableOutput("table_one")),
                          tabPanel("Summary")
              ),
              p(textOutput("statement_one"))
            )
          )
        ),
        tabPanel("Chloropleth Map",
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
