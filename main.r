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



# Stratified sampling
strata <- cut(movie_data$RELEASE_YEAR, breaks = c(0, 1982, 2000, 2022)) # Define Strata used 
strata_size <- 5 # size for each strata

# Initialize Dataframes for each Strata
stratified_sample1 <- data.frame()
stratified_sample2 <- data.frame()
stratified_sample3 <- data.frame()

itr <- 1 #trakc number of iterations

# Loop through each unique strata
for (strat in unique(strata)) {
  print(itr)
  print(strat)
  
  # Subset the data for the each strata
  strata_data <- movie_data[strata == strat, ]
  
  # Check if the number of observations in the strata is less than the strata size
  if (nrow(strata_data) < strata_size) {
    # If so, sample all of the observations
    stratum_sample <- strata_data
  } else {
    # If not, sample the desired number of observations without replacement
    stratum_sample <- strata_data[sample(nrow(strata_data), strata_size, replace = FALSE), ]
  }
  # Add the sampled observations to their respective stratified sample dataframe
  if( itr == 1 ){
    stratified_sample1 <- rbind(stratified_sample1, stratum_sample)
  }
  else if( itr == 2 ){
    stratified_sample2 <- rbind(stratified_sample2, stratum_sample)
  }
  else if( itr == 3 ){
    stratified_sample3 <- rbind(stratified_sample3, stratum_sample)
  }
    else { 
   print( "Error Encountered")
    }
  
  itr <- itr + 1
}

# Bind the dataframes
stratified_sample <- rbind(stratified_sample1,stratified_sample2,stratified_sample3)
# Print the sample dataframe
stratified_sample




# Systematic sampling
n <- 9 # sample size
N <- nrow(movie_data) # Population size
k <-  nrow(movie_data) %/% n # Determine the sampling interval
start <- sample(1:k, 1) # Determine the starting point
systematic_sample <- movie_data[seq(from = start, to = k*n, by = k), ]
systematic_sample


