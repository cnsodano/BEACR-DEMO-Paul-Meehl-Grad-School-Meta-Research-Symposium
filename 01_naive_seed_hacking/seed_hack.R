box::use(dplyr[...])
box::use(purrr[...])
box::use(furrr[...])
box::use(progressr[...])
box::use(future[...])
box::use(palmerpenguins[penguins])
box::use(tidyr[drop_na])


eval <- function(data_nrow, y) {
  model_predictions = sample(c(1, 0), size = data_nrow, replace = TRUE)
  return(mean(model_predictions == y))
}

seed_hack <- function(data, max_num_seeds_to_try, seed_start = 0) {
  seeds = seed_start:max_num_seeds_to_try
  y = data |> pull(label)
  is_hackable = map_dbl(
    .x = seeds,
    .f = function(.x) {
      withr::with_seed(.x, {
        return(eval(nrow(data), y))
      })
    },
    .progress = TRUE
  )
  return(is_hackable)
}
set.seed(42)


data = palmerpenguins::penguins |>
  tidyr::drop_na() |>
  mutate(label = if_else(sex == "male", 1, 0)) |>
  select(where(is.numeric)) # Only use numeric features for simplicity

set.seed(0)
hacked_seeds = seed_hack(10000, 0, data = data)
save()
