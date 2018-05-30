## James Kim, Joe Ubelhart, Timmy Tang, Owen DeArmond-MacLeod
## Section AD

#install.packages('DT')
#install.packages("ggiraph")
#install.packages("R.oo")

library(DT)
library(httr)
library(jsonlite)
library(dplyr)
library(shiny)
library(ggplot2)
library(plotly)
library(maps)
library(ggiraph)
source("apikeys.R")

## Authorization

prev_oauth <- "./.httr-oathr"
if (file.exists(prev_oauth)) file.remove(prev_oauth)

spotify_auth <- oauth_endpoint(
  authorize = "https://accounts.spotify.com/authorize",
  access = "https://accounts.spotify.com/api/token"
)
myapp <- oauth_app(client_id, client_id, client_secret)
keys <- oauth2.0_token(spotify_auth, myapp, scope = "playlist-read-private")
keys$refresh()
header_key <- paste(
  keys$credentials$token_type, 
  keys$credentials$access_token
)

base_uri <- "https://api.spotify.com/v1/"

download.file("https://spotifycharts.com/regional/global/daily/latest/download", destfile = "top200.csv")
top_200 <- read.csv("top200.csv", stringsAsFactors = FALSE)


## Example to find data (Featured Playlist as example)
# browse_playlist_endpoint <- paste0(base_uri, "browse/featured-playlists")
# playlists <- GET(
#   url = browse_playlist_endpoint, 
#   add_headers("Authorization" = header_key)
# )
# 
# content <- content(playlists)
# 
# america_endpoint <- paste0(base_uri, "audio-features/0b9oOr2ZgvyQu88wzixux9")
# this_is_america <- GET(
#   url = america_endpoint, 
#   add_headers("Authorization" = header_key)
# )
# america_content <- content(this_is_america)



## Gets top 100 songs and combines with audio analysis

top_100 <- top_200 %>% 
  head(100) %>% 
  mutate(id = sapply(strsplit(URL, "/"), "[[", 5))

id_query <- paste0(top_100$id, collapse = ",")

song_list_endpoint <- paste0(base_uri, "audio-features")
top_100_songs <- GET(
  url = song_list_endpoint, 
  query = list("ids" = id_query),
  add_headers("Authorization" = header_key)
)

top_100_content <- content(top_100_songs)

top_100_df <- do.call(rbind.data.frame, top_100_content[[1]])

top_100_df <- right_join(top_100_df, top_100, by = "id")


top_100_df[is.na(top_100_df)] <- 0

## Test animated metronome

# animation_test_row <- top_100_df %>% 
#   filter(position == 1) 
# 
# 
# df <- data.frame(
#   x = c(1,2,3,4), 
#   f = c(1,2,3,4)
# )
# 
# p <- df %>%
#   plot_ly(
#     x = ~x,
#     frame = ~f,
#     type = 'bar',
#     showlegend = F
#   ) %>% 
#   animation_opts(frame = 60000 / animation_test_row$tempo, mode = "next")
# p



## James's Work
top_100_df_james <- top_100_df %>% 
  rename("Track Name" = Track.Name,
         "Danceability" = danceability,
         "Energy" = energy,
         "Key" = key,
         "Loudness" = loudness,
         "Speechiness" = speechiness,
         "Acousticness" = acousticness,
         "Instrumentalness" = instrumentalness,
         "Liveness" = liveness,
         "Valence" = valence,
         "Tempo" = tempo
         ) %>% 
  mutate("Href" = paste0("<a href = ", URL, ">Listen</a>")) %>% 
  select("Track Name", "Artist", "Acousticness", "Danceability", "Energy",
         "Instrumentalness", "Key", "Liveness", "Loudness", "Speechiness",  
         "Tempo", "Valence", "Streams", "Href")
  
column_names_james <- top_100_df_james %>% 
  select("Acousticness", "Danceability", "Energy",
         "Instrumentalness", "Key", "Liveness", "Loudness", "Speechiness",  
         "Tempo", "Valence")
  
## Timmy's work

country_code <- c("us",
                  "gb",
                  "ar",
                  "at",
                  "au",
                  "be",
                  "bo",
                  "br",
                  "ca",
                  "ch",
                  "cl",
                  "co",
                  "cr",
                  "cz",
                  "de",
                  "dk",
                  "do",
                  "ec",
                  "ee",
                  "es",
                  "fi",
                  "fr",
                  "gr",
                  "gt",
                  "hk",
                  "hn",
                  "hu",
                  "id",
                  "ie",
                  "il",
                  "is",
                  "it",
                  "jp",
                  "lt",
                  "lv",
                  "mx",
                  "my",
                  "ni",
                  "nl",
                  "no",
                  "nz",
                  "pa",
                  "pe",
                  "ph",
                  "pl",
                  "pt",
                  "py",
                  "ro",
                  "se",
                  "sg",
                  "sk",
                  "sv",
                  "th",
                  "tr",
                  "tw",
                  "uy",
                  "vn") %>% toupper()
world_map <- map_data("world") %>% group_by(region)
world_map$Country_desig = iso.alpha(world_map$region, n = 2)

has_data <- data.frame("Country_desig" = country_code, "highlight" = T)
combine <- left_join(world_map, has_data, by = "Country_desig")

data_has <- right_join(world_map, has_data, by = "Country_desig")


combine$highlight[is.na(combine$highlight)] <- F

#################
## Owen's Work ##
#################

top_50 <- top_100 %>%
  select(id) %>% 
  head(n = 50)

id_query_track <- paste0(top_50$id, collapse = ",")

track_list_endpoint <- paste0(base_uri, "tracks")
response <- GET(
  url = track_list_endpoint, 
  query = list("ids" = id_query_track),
  add_headers("Authorization" = header_key)
)

body <- content(response, "text")

parsed_top_50 <- fromJSON(body)

top_50_df <- data.frame(parsed_top_50)

top_50 <- top_50_df %>% 
  rename(
    "Name" = tracks.name,
    "Position" = tracks.disc_number,
    "Explicit" = tracks.explicit,
    "Popularity" = tracks.popularity,
    "Length" = tracks.duration_ms
  ) %>% 
  select(Name, Position, Explicit, Popularity, Length) %>% 
  mutate(
    Length = Length / 1000
  )

#################