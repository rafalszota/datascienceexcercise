recreateDataSets(whole_data)
remove_NA()
#Best option for scaling is 5
scale_by_root(5)

glm_fit <- glm(formula, data = train)
summary.glm(glm_fit)



coefficients_low_p_value <- summary.glm(glm_fit)$coefficients[,4]
cols_low_p_value <- names(which(coefficients_low_p_value < 0.01))
#remove intercept
cols_low_p_value <- cols_low_p_value[-1]


# Subset the columns
train <- train[c(cols_low_p_value, "y")]
test <- test[c(cols_low_p_value, "y")]


#Check the new fit
glm_fit_2 <- glm(formula, data = train)
evaluate(glm_fit_2)

# RMSE Accuracy % 
# 36.30616    7.18000 


forest_fit <- rpart(formula, data = train, method = "anova")
evaluate(forest_fit)


#  RMSE Accuracy % 
# 59.0666     4.8000 


