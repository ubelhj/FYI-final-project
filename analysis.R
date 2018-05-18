library(httr)
library(jsonlite)
source("api-keys.R")

## Authorization
spotify_auth <- oauth_endpoint(
  authorize = "https://accounts.spotify.com/authorize",
  access = "https://accounts.spotify.com/api/token"
)
myapp <- oauth_app(client_id, client_id, client_secret)
keys <- oauth2.0_token(spotify_auth, myapp, scope = "playlist-read-private")
header_key <- paste(
  keys$credentials$token_type, 
  keys$credentials$access_token
)

base_uri <- "https://api.spotify.com/v1/"

download.file("https://spotifycharts.com/regional/global/daily/latest/download", destfile = "top200.csv")
top_200 <- read.csv("top200.csv")


## Example to find data (Featured Playlist as example)
browse_playlist_endpoint <- paste0(base_uri, "browse/featured-playlists")
playlists <- GET(
  url = browse_playlist_endpoint, 
  add_headers("Authorization" = header_key)
)

playlist_content <- content(playlists)

top_list_uri <- paste0(base_uri, "browse/categories/toplists")
top_json <- GET(
  url = top_list_uri, 
  add_headers("Authorization" = header_key)
)
top_list_content <- content(categories)

