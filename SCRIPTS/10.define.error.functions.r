# define RMSE and MAE functions

rmse <- function(error) {
  sqrt(mean(error^2, na.rm = TRUE))
}


mae <- function(error) {
  mean(abs(error), na.rm = TRUE)
}
