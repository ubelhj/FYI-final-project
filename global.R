library(httr)
library(jsonlite)
library(dplyr)
library(shiny)
library(ggplot2)
library(plotly)
source("apikeys.R")

## Authorization
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
browse_playlist_endpoint <- paste0(base_uri, "browse/featured-playlists")
playlists <- GET(
  url = browse_playlist_endpoint, 
  add_headers("Authorization" = header_key)
)

content <- content(playlists)

america_endpoint <- paste0(base_uri, "audio-features/0b9oOr2ZgvyQu88wzixux9")
this_is_america <- GET(
  url = america_endpoint, 
  add_headers("Authorization" = header_key)
)
america_content <- content(this_is_america)



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

ggplot(top_100_df, aes(Position, tempo, size = Streams, color = time_signature)) +
  geom_point()
