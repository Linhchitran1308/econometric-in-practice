library(tseries)

set.seed(123)

# -------- Simulation functions --------
simulate_rw <- function(n = 200) {
  cumsum(rnorm(n))
}

simulate_wn <- function(n = 200) {
  rnorm(n)
}

R <- 1000

# -------- Monte Carlo experiment --------
p_rw <- replicate(R, adf.test(simulate_rw())$p.value)
p_wn <- replicate(R, adf.test(simulate_wn())$p.value)

cat("ADF rejection rate (Random Walk):",
    round(mean(p_rw < 0.05), 3), "\n")

cat("ADF rejection rate (White Noise):",
    round(mean(p_wn < 0.05), 3), "\n")
