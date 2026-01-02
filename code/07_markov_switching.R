library(readxl)
library(tidyverse)
library(MSwM)

# Load data
df <- read_excel("data/Data_KON.xlsx") %>%
  mutate(year = as.integer(year)) %>%
  arrange(year)

# Base linear regression
base_model <- lm(KP ~ KB + CP, data = df)

# 2-regime Markov-switching model
# sw length = number of coefficients (Intercept, KB, CP)
ms_model <- msmFit(
  base_model,
  k = 2,
  sw = c(TRUE, TRUE, TRUE, TRUE)
)

summary(ms_model)

# Plot regime probabilities
plot(ms_model)
