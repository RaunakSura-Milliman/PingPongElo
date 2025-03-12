library(plumber)

# Define the CORS filter
#* @filter cors
cors <- function(req, res) {
  res$setHeader("Access-Control-Allow-Origin", "*")
  res$setHeader("Access-Control-Allow-Methods", "GET, POST, OPTIONS")
  res$setHeader("Access-Control-Allow-Headers", "Content-Type")
  plumber::forward()
}

# Plumb the file
pr <- plumb("C:/Users/raunak.sura/Desktop/PingPongElo/PingPongElo/PingPongElo.R")

# Add the CORS filter to the Plumber router
pr$registerHooks(
  list(
    preroute = cors
  )
)

# Run the API
pr$run(port = 8000)