# Load the jsonlite package
library(jsonlite)

# Create a list of players and their ratings
ratings_list <- list(
  Victor = 1000,
  Zoe = 1000,
  Cameron = 1000,
  Raunak = 1000,
  Charlotte = 1000,
  Adam = 1000,
  Simon = 1000,
  Alexson = 1000,
  Brendan = 1000,
  David = 1000,
  Durand = 1000,
  Alice = 1000,
  Julia = 1000,
  Jessica = 1000,
  Bryan = 1000,
  Jack = 1000
)

# Convert the list to JSON and write it to a file
write_json(ratings_list, "players.json", pretty = TRUE)