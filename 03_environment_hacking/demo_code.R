library(dplyr)
set.seed(42)
before = .Random.seed
df <- data.frame(
  hours = c(40, 35, 45, 38),
  rate = c(25, 30, 50, 45)
)

# Call some randomness to prove that the state should change
runif(3)

df |>
  mutate(
    pay = hours * rate,
  )

after = .Random.seed

# Random state is however the exact same! dplyr::mutate sets seed to 42
print(identical(before, after))
