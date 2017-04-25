# Benchmark with all predictors

formula <- y ~ .

glm_fit <- glm(formula, data = train)
forest_fit <- rpart(formula, data = train, method = "anova")

evaluate(glm_fit)
#RMSE CORRECT % 
#508.3635    0.2300 


evaluate(forest_fit)
#RMSE CORRECT % 
#57.00891   5.20000 





