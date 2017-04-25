recreateDataSets(whole_data)
remove_NA()
#Best option for scaling is 5
scale_by_root(5)

formula <- y ~ .
glm_fit <- glm(formula, data = train)


glm_fit <- stripGlmLR(glm_fit)
saveRDS(glm_fit, "model.rds")
