recreateDataSets(whole_data)
remove_NA()

glm_fit <- glm(formula, data = train)
evaluate(glm_fit)

# RMSE Accuracy % 
# 54.69914    4.92000 


forest_fit <- rpart(formula, data = train, method = "anova")
evaluate(forest_fit)

# RMSE Accuracy % 
# 58.80077    4.86000 