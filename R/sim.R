library(tidyverse)

# R/sim.R
# Data simulators for the course. Sourced by every exercises.qmd.

#' Simulate the study guide's bottle DCE
#'
#' Module 0, exercise 2: write the body of this function.
#'
#' Design: each person answers `n_tasks` choice questions, each with `n_alts`
#' bottles. Attributes per bottle:
#'   - price:    1.00, 1.50, 2.00, 2.50, 3.00 (dollars)
#'   - recycled: 0, 0.25, 0.50, 0.75, 1 (share of recycled content)
#'   - brand:    0 = store brand, 1 = name brand
#' Each attribute level is drawn at random for every bottle (a random design).
#'
#' True preferences (from the guide):
#'   - beta_price    = -1.2 (fixed)
#'   - beta_recycled ~ Normal(mean = 0.8, sd = 1.2), one draw per person
#'   - beta_brand    = 0.4 (fixed)
#' Utility: U = V + e, with e drawn from a standard Gumbel (Type I EV).
#'
#' @param n_people Number of respondents.
#' @param n_tasks  Choice questions per respondent.
#' @param n_alts   Alternatives per question.
#' @param seed     Random seed for reproducibility.
#' @return A list with two elements:
#'   - data: long-format data frame, one row per alternative per question,
#'           columns respID, obsID, altID, price, recycled, brand, choice
#'   - true_beta: data frame with respID and each person's true beta_recycled

sim_bottles <- function(n_people = 400, n_tasks = 8, n_alts = 3, seed = 1) {
  set.seed(seed)

  beta_r <- rnorm(n_people, mean = 0.8, sd = 1.2)
  beta_price <- -1.2
  beta_brand <- 0.4

  df <- expand.grid(altID = 1:n_alts, task = 1:n_tasks, respID = 1:n_people ) %>%
    mutate(
        obsID = (respID - 1) * n_tasks + task,
        price = sample(c(1, 1.5, 2, 2.5, 3), n(), replace = TRUE),
        recycled = sample(c(0, 0.25, 0.5, 0.75, 1), n(), replace = TRUE),
        brand = sample(c(0, 1), n(), replace = TRUE),
        beta_recycled = beta_r[respID],
        V = beta_recycled * recycled + beta_price * price + beta_brand * brand,
        epsilon = -log(-log(runif(n()))),
        U = V + epsilon
    ) %>%
    group_by(obsID) %>%
    mutate(choice = if_else(U == max(U), 1, 0)) %>%
    ungroup()

  data <- select(df, respID, obsID, altID, price, recycled, brand, choice)
  true_beta <- df %>%
    distinct(respID, beta_recycled)

  list(data = data, true_beta = true_beta)
}
