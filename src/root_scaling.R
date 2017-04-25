
evaluate_root_scaling <- function(i) {

  recreateDataSets(whole_data)
  remove_NA()
  scale_by_root(i)
  
  glm_fit <- glm(formula, data = train)
  evaluate(glm_fit)["Accuracy %"]
  
    
}  




accuracy_by_scaling <- sapply(seq(1:10), evaluate_root_scaling)

plot(seq(1:10), accuracy_by_scaling)
which.max(accuracy_by_scaling)

#best scaling by root 1/5


recreateDataSets(whole_data)
remove_NA()
scale_by_root(5)
formula <- y ~ .
glm_fit <- glm(formula, data = train)
saveRDS(glm_fit, "model.rds")