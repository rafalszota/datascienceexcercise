
evaluate <- function(fit) {
  
  predictions <- predict(fit, test)
  RMSE <- sqrt(mean((test$y-predictions)^2, na.rm=T))
  Accuracy <- round(sum(abs(test$y - predictions) <= 3.0, na.rm = T)/nrow(test)*100, digits=2)
  
  result <- c(RMSE, Accuracy)
  names(result) <- c("RMSE", "Accuracy %")
  result
  
}


scale_by_root <- function(i) {
  
  y_index <- ncol(train)
  train[-y_index] <<- sign(train[-y_index]) * abs((train[-y_index]))^(1/i)
  test[-y_index] <<-  sign(test[-y_index])  * abs((test[-y_index]))^(1/i)
  
} 


get_skewed_predictors <- function(threshold = 1) {
  
  col_index <- ncol(train) - 1
  result <- sapply(seq(1:col_index), function(i) {
    abs(skewness(train[[i]], na.rm = T)) > threshold
  })
  
  #if NA assume it is skewed
  result[is.na(result)] <- T
  result
  
}


remove_skewed_predictors <- function(skewed_predictors) {
  
  index <- length(skewed_predictors)
  train[1:index] <<- train[!skewed_predictors]
  test[1:index] <<-  test[!skewed_predictors]
  
  
}
