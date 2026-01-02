library(readxl)
library(tidyverse)
library(strucchange)

# Load data
df <- read_excel("data/Data_KON.xlsx") %>%
  mutate(year = as.integer(year)) %>%
  arrange(year)

# Baseline regression
m <- lm(KP ~ KB + CP, data = df)
summary(m)

# -------- Structural breaks (unknown dates) --------
bp <- breakpoints(KP ~ KB + CP, data = df)
summary(bp)

# Plot breakpoints and BIC
plot(bp)

# -------- Chow test at midpoint (illustrative) --------
mid <- floor(nrow(df) / 2)
sctest(m, type = "Chow", point = mid)

# -------- Outlier & influence diagnostics --------
cook <- cooks.distance(m)

plot(cook,
     type = "h",
     main = "Cook's Distance",
     ylab = "Cook's D")

abline(h = 4 / nrow(df), lty = 2, col = "red")
