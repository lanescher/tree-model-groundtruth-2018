# define RMSE and MAE functions

rmse <- function(error) {
  sqrt(mean(error^2))
}


mae <- function(error) {
  mean(abs(error))
}
