install.packages(c("e1071", "rpart"), repos="http://cran.rstudio.com/")
require(e1071)
require(rpart)

input_file_name  <- commandArgs(trailingOnly=TRUE)[1]
result_file_name <- "result.txt"
model_file_name  <- "model.rds"

print("Generating predictions...")

data <- read.csv(input_file_name, stringsAsFactors = F)
model <- readRDS(model_file_name)

data[1:304] <- (data[1:304])^(1/5)
predictions <- predict(model, data)
write.csv(predictions, result_file_name)

RMSE <- sqrt(mean((data$y-predictions)^2, na.rm=T))
Accuracy <- round(sum(abs(data$y - predictions) <= 3.0, na.rm = T)/nrow(data)*100, digits=2)


print(c("RMSE: ", RMSE))
print(c("Accuracy %: ", Accuracy))
print(c("Results written to: ", result_file_name))