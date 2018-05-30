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
  ## Definition of Music Traits
  output$definition_one <- renderText({
    if(audio_one() == "Danceability"){
      one <- HTML(paste0("<b>Danceability: </b> How suitable a track is for 
               dancing based on a combination of musical elements including tempo,
               rhythm stability, beat strength, and overall regularity. A value of
               0.0 is least danceable and 1.0 is most danceable."))
    }
    if(audio_one() == "Energy"){
      one <- HTML(paste0("<b>Energy: </b> Measure from 0.0 to 1.0 and represents
               a perceptual measure of intensity and activity. Typically, energetic
               tracks feel fast, loud, and noisy."))
    }
    if(audio_one() == "Key"){
      one <- HTML(paste0("<b>Key: </b> The key the track is in. Integers map to
               pitches using standard <a href=https://en.wikipedia.org/wiki/Pitch_class>
               Pitch Class notation.</a>"))
    }
    if(audio_one() == "Loudness"){
      one <- HTML(paste0("<b>Loudness: </b> Quality of a sound that is the primary
               psychological correlate of physical strength (amplitude) measured
               in decibels(dB). Values typical range between -60 and 0 db."))
    }
    if(audio_one() == "Speechiness"){
      one <- HTML(paste0("<b>Speechiness: </b> Speechiness detects the presence of
               spoken words in a track. The more exclusively speech-like the
               recording the closer to 1.0 the attribute value. Values between 0.33
               and 0.66 describe tracks that may contain both music and speech,
               either in sections or layered, including such cases as rap music."))
    }
    if(audio_one() == "Acousticness"){
      one <- HTML(paste0("<b>Acousticness: </b> A confidence measure from 0.0 to
               1.0 of whether the track is acoustic. 1.0 represents high confidence
               the track is acoustic."))
    }
    if(audio_one() == "Instrumentalness"){
      one <- HTML(paste0("<b>Instrumentalness: </b> Predicts whether a track
               contains no vocals. The closer the instrumentalness value is to 1.0,
               the greater likelihood the track contains no vocal content."))
    }
    if(audio_one() == "Liveness"){
      one <- HTML(paste0("<b>Liveness: </b> Detects the presence of an audience 
               in the recording. Higher liveness values represent an increased
               probability that the track was performed live."))
    }
    if(audio_one() == "Valence"){
      one <- HTML(paste0("<b>Valence: </b> A measure from 0.0 to 1.0 describing the
               musical positiveness conveyed by a track. Tracks with high valence
               sound more positive, while tracks with low valence sound more negative."))
    }
    if(audio_one() == "Tempo"){
      one <- HTML(paste0("<b>Tempo: </b> The overall estimated tempo of a track in beats
               per minute(BPM). In musical terminology, tempo is the speed or pace of a
               given piece and derives directly from the average beat duration."))
    }
    if(audio_one() == "Streams") {
      one <- HTML(paste0("<b>Streams: </b> The total global streams of each song yesterday"))
    }
    one
  })
  output$definition_two <- renderText({
    if(audio_two() == "Danceability"){
      two <- HTML(paste0("<b>Danceability: </b> How suitable a track is for 
                         dancing based on a combination of musical elements including tempo,
                         rhythm stability, beat strength, and overall regularity. A value of
                         0.0 is least danceable and 1.0 is most danceable."))
    }
    if(audio_two() == "Energy"){
      two <- HTML(paste0("<b>Energy: </b> Measure from 0.0 to 1.0 and represents
                         a perceptual measure of intensity and activity. Typically, energetic
                         tracks feel fast, loud, and noisy."))
    }
    if(audio_two() == "Key"){
      two <- HTML(paste0("<b>Key: </b> The key the track is in. Integers map to
                         pitches using standard <a href=https://en.wikipedia.org/wiki/Pitch_class>
                         Pitch Class notation.</a>"))
    }
    if(audio_two() == "Loudness"){
      two <- HTML(paste0("<b>Loudness: </b> Quality of a sound that is the primary
                         psychological correlate of physical strength (amplitude) measured
                         in decibels(dB). Values typical range between -60 and 0 db."))
    }
    if(audio_two() == "Speechiness"){
      two <- HTML(paste0("<b>Speechiness: </b> Speechiness detects the presence of
                         spoken words in a track. The more exclusively speech-like the
                         recording the closer to 1.0 the attribute value. Values between 0.33
                         and 0.66 describe tracks that may contain both music and speech,
                         either in sections or layered, including such cases as rap music."))
    }
    if(audio_two() == "Acousticness"){
      two <- HTML(paste0("<b>Acousticness: </b> A confidence measure from 0.0 to
                         1.0 of whether the track is acoustic. 1.0 represents high confidence
                         the track is acoustic."))
    }
    if(audio_two() == "Instrumentalness"){
      two <- HTML(paste0("<b>Instrumentalness: </b> Predicts whether a track
                         contains no vocals. The closer the instrumentalness value is to 1.0,
                         the greater likelihood the track contains no vocal content."))
    }
    if(audio_two() == "Liveness"){
      two <- HTML(paste0("<b>Liveness: </b> Detects the presence of an audience 
                         in the recording. Higher liveness values represent an increased
                         probability that the track was performed live."))
    }
    if(audio_two() == "Valence"){
      two <- HTML(paste0("<b>Valence: </b> A measure from 0.0 to 1.0 describing the
                         musical positiveness conveyed by a track. Tracks with high valence
                         sound more positive, while tracks with low valence sound more negative."))
    }
    if(audio_two() == "Tempo"){
      two <- HTML(paste0("<b>Tempo: </b> The overall estimated tempo of a track in beats
                         per minute(BPM). In musical terminology, tempo is the speed or pace of a
                         given piece and derives directly from the average beat duration."))
    }
    if(audio_two() == "Streams") {
      two <- HTML(paste0("<b>Streams: </b> The total global streams of each song yesterday"))
    }
    two
    })
  
  ## Statement
  output$statement_one <- renderText({
    HTML(paste0("The data used are for the traits: <b>",
           audio_one(), "</b> and <b>", audio_two(), "</b>")
    )
  })
  ## Output for data table
  output$table_one <- DT::renderDataTable(DT::datatable({
    top_100_df_james %>% select("Track Name", "Artist", audio_one(), audio_two())
  }))
  ## Output for summary table
  output$summary <- DT::renderDataTable(DT::datatable({
    average_one <- ~paste0(audio_one(), "Average")
    average_two <- ~paste0(audio_two(), "Average")
    top_100_df_james %>% select(audio_one(), audio_two()) %>% 
      summarize("Average for First Audio Trait" = mean(get(audio_one())),
                "Max for First Audio Trait" = max(get(audio_one())),
                "Min for First Audio Trait" = min(get(audio_one())),
                "Average for Second Audio Trait" = mean(get(audio_two())),
                "Max for Second Audio Trait" = max(get(audio_two())),
                "Min for Second Audio Trait" = min(get(audio_two()))
      )
  }))
  
  ## Output for plot
  output$plot <- renderPlotly({
    font <- list(family = "arial",
                 size = 14)
    x <- list(title = audio_one(),
              titlefont = font)
    y <- list(title = audio_two(),
              titlefont = font)
    title <- ~paste0(audio_one(), " vs. ", audio_two(), " Scatter Plot")
    
    plot_ly(top_100_df_james, x = ~get(audio_one()), y = ~get(audio_two()),
            text = ~paste0("Track Name: ", `Track Name`, 
                           "<br>Artist: ", `Artist`,
                           "<br>", audio_one(), ": ", get(audio_one()),
                           "<br>", audio_two(), ": ", get(audio_two()))) %>% 
      layout(title = title, 
             xaxis = x, 
             yaxis = y)
    
  })

## Joe's Server Portion
  
  ## Metronome plot
  # output$tempo_plot <- renderPlot(
  #   #ggplotly(
  #   ggplot(top_100_df, aes(tempo, danceability)) +
  #     geom_point(aes(color = cut(time_signature, breaks = 2), size = streams)) +
  #     geom_smooth(method = "lm", formula = y~x)
  #   #)
  # )
  
  ## Click data and link to song
  output$features_click <- renderText({
    point <- event_data("plotly_click")
    paste0(
      "<h4><b><u>Song Information</u></b>",
      "<br><b>Track Name: </b>",
      top_100_df_james[(point$pointNumber + 1), "Track Name"],
      "<br><b>Artist: </b>",
      top_100_df_james[(point$pointNumber + 1), "Artist"],
      "<br><b>Streams: </b>",
      top_100_df_james[(point$pointNumber + 1), "Streams"],
      "<br><b>",
      audio_one(),
      ": </b>",
      top_100_df_james[(point$pointNumber + 1), audio_one()],
      "<br><b>",
      audio_two(),
      ": </b>",
      top_100_df_james[(point$pointNumber + 1), audio_two()],
      "<br>",
      top_100_df_james[(point$pointNumber + 1), "Href"]
    )
  })
  
  output$features_analysis <- renderText({
    paste0(
      "Before looking at the data, we wondered, what if audio features such ",
      "as Tempo affected a song's popularity. The answer is no. The top 100 ",
      "global songs are scattered reasonably randomly, with no correlation. This ",
      "conclusion, in hindsight, seems pretty apparent. People's music tastes vary,",
      "and even, a single album has many different beats and styles."
    )
  })

#################
## Owen's Work ##
#################

  output$more_info <- renderText({
    point <- event_data("plotly_click")
    paste0(
      "<h4><b><u>Song Information</u></b>",
      "<br><b>Track Name: </b>"#,
      #filter(top_50$Popularity == point$pointNumber)
    )
  })
  
  output$plot2 <- renderPlotly({
    
    plot_ly(top_50, x = ~Popularity, y = ~Length, text = top_50$Name, color = ~Explicit) %>% 
      layout(
        xlab("Popularity Ranking"),
        ylab("Length (Seconds)"),
        showlegend = FALSE
      )
    
  })
#################
  
## Timmy's Server Portion
  country_choose <- reactive({
    input$countries
  })

  output$statement_two <- renderText({
    HTML(paste0(country_choose(), "'s Top 200 Songs")
    )
  })  
  output$plot_map <- renderggiraph({ 
    map_plot <- ggplot(data = combine) +
                  geom_polygon_interactive(
                    mapping = aes(x = long, 
                                  y = lat, 
                                  group = group, 
                                  fill = highlight,
                                  tooltip = sprintf("%s<br/>%s",
                                                    region, 
                                                    highlight)),
                               color = "black") +
      coord_quickmap() +
      scale_fill_manual(values = c("#FFFFFF", "#1DB954")) +
      labs(title = "",
           x = "",
           y = "") + 
      theme(axis.line=element_blank(),axis.text.x=element_blank(),
            axis.text.y=element_blank(),axis.ticks=element_blank(),
            axis.title.x=element_blank(),
            axis.title.y=element_blank(),
            panel.background=element_blank(),panel.border=element_blank(), 
            panel.grid.major=element_blank(),
            panel.grid.minor=element_blank(),plot.background=element_blank(), 
            plot.title = element_text(hjust = 0.5),
            legend.position="none"
      )
    ggiraph(code = {print(map_plot)})
    
  })

  
  output$top10table <- DT::renderDataTable(DT::datatable({
      selected <- iso.alpha(country_choose(), n =2) %>% tolower()
      
      download.file(paste0("https://spotifycharts.com/regional/",
                           selected, "/daily/latest/download"), 
                    destfile = paste0("top200", selected,".csv"))
      top_200 <- read.csv(paste0("top200", selected, ".csv"),
                          stringsAsFactors = FALSE, fileEncoding = "UTF8")
      top_200 <- data.frame(top_200) %>%
        rename("Track Name" = Track.Name) %>%
        select(Position, 'Track Name', Artist)
      top_200
  }))
    
}

shinyServer(server)
