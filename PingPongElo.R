# Load necessary libraries
library(elo)

# Create an environment to store ratings
ratings_env <- new.env()

# Initialize players and their ratings in the environment
ratings_env$ratings <- list(
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

#* @get /ratings
#* Return the current ratings
function() {
  return(as.list(ratings_env$ratings))
}

#* @post /match
#* Update ratings based on a match result
#* @param winner The name of the winning player
#* @param loser The name of the losing player
function(winner, loser) {
  if (!(winner %in% names(ratings_env$ratings)) || !(loser %in% names(ratings_env$ratings))) {
    return(list(error = "Player not found"))
  }
  
# Get current ratings
rating_winner <- ratings_env$ratings[[winner]]
rating_loser <- ratings_env$ratings[[loser]]

# Set K-factor for Elo rating adjustment
k_factor <- 32

# Calculate expected scores
expected_winner <- elo.prob(rating_winner, rating_loser)
expected_loser <- elo.prob(rating_loser, rating_winner)

# Calculate new ratings
new_rating_winner <- elo.update(rating_winner, expected_winner, 1, k_factor)
new_rating_loser <- elo.update(rating_loser, expected_loser, 0, k_factor)

# Update ratings in the environment
ratings_env$ratings[[winner]] <- new_rating_winner
ratings_env$ratings[[loser]] <- new_rating_loser

return(list(
  winner = list(name = winner, rating = ratings_env$ratings[[winner]]),
  loser = list(name = loser, rating = ratings_env$ratings[[loser]])
))
}

# Helper function to update Elo rating
elo.update <- function(current_rating, expected_score, actual_score, k_factor) {
return(current_rating + k_factor * (actual_score - expected_score))
}
