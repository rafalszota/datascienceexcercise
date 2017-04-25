load_whole_data <- function() {
  read.csv("dataset_00_with_header.csv", stringsAsFactors = F)  
} 


recreateDataSets <- function(whole_data) {

  set.seed(123)
  sample_index <- sample(seq(1:1e5), 7e4)

  train <<- whole_data[sample_index,]
  test <<- whole_data[-sample_index,]

}

remove_NA <- function() {
  
  NA_cols <- sapply(seq(1:304), function(i) anyNA(train[i]))
  
  train <<- train[!NA_cols]
  test <<- test[!NA_cols]
  
}
