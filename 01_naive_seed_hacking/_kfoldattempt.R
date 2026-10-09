# eval_kfold <- function(data, y, k = 3) {
#   folds = rep(1:k, each = floor(nrow(data) / k)) # Imprecise but ok for simplicity
#   return(mean(sapply(1:k, function(i) {
#     train = data[folds != i, ]
#     test = data[folds == i, ]
#     model_predictions = sample(c(1, 0), size = nrow(test), replace = TRUE)
#     test_labels = test |> pull(label)
#     return(mean(model_predictions == test_labels))
#   })))
# }
