# Get data
movie_data <- read.csv("Best Movie by Year Netflix.csv")

# Simple Random Sampling
# SRS with replacement
set.seed(1)  # Set seed for reproducibility
sample_size <- 20
srs_with_replacement <- movie_data[sample(nrow(movie_data), sample_size,replace = TRUE),]
"WITH REPLACEMENT"
srs_with_replacement

# SRS without replacement
srs_without_replacement <- movie_data[sample(nrow(movie_data), sample_size,replace = FALSE),]
"WITHOUT REPLACEMENT"
srs_without_replacement

