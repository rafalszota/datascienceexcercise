recreateDataSets(whole_data)
remove_NA()
#Best option for scaling is 5
scale_by_root(5)
remove_skewed_predictors(get_skewed_predictors(1))



glm_fit <- glm(formula, data = train)
evaluate(glm_fit)

# RMSE Accuracy % 
# 42.45525    6.44000 


forest_fit <- rpart(formula, data = train, method = "anova")
evaluate(forest_fit)

# RMSE Accuracy % 
# 65.19326    4.19000 