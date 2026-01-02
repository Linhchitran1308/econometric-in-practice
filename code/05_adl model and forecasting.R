library(readxl)
library(tidyverse)
library(lubridate)

df <- read_excel("data/Data_KON.xlsx") %>%
  rename(date = `month/year`) %>%
  mutate(
    date = as.Date(date),
    year = as.integer(year)
  ) %>%
  arrange(date)

df_m <- df %>%
  mutate(KP_lag1 = lag(KP, 1)) %>%
  drop_na()

adl <- lm(KP ~ KP_lag1 + KB + CP, data = df_m)
summary(adl)

phi <- coef(adl)["KP_lag1"]
beta_kb <- coef(adl)["KB"]
LRM_KB <- beta_kb / (1 - phi)
LRM_KB

h <- 12
last_date <- max(df_m$date)
future_dates <- seq(from = last_date %m+% months(1),
                    by = "month", length.out = h)

KB_future <- rep(tail(df_m$KB, 1), h)
CP_future <- rep(tail(df_m$CP, 1), h)

kp_prev <- tail(df_m$KP, 1)

fc_mean <- numeric(h)
fc_se   <- numeric(h)

for (i in 1:h) {
  newrow <- data.frame(
    KP_lag1 = kp_prev,
    KB = KB_future[i],
    CP = CP_future[i]
  )
  pr <- predict(adl, newdata = newrow, se.fit = TRUE)
  fc_mean[i] <- pr$fit
  fc_se[i]   <- pr$se.fit
  kp_prev <- fc_mean[i]
}

z95 <- 1.96
fc <- tibble(
  date = future_dates,
  mean = fc_mean,
  lo95 = fc_mean - z95 * fc_se,
  hi95 = fc_mean + z95 * fc_se
)

ggplot() +
  geom_line(data = df_m, aes(date, KP)) +
  geom_ribbon(data = fc, aes(date, ymin = lo95, ymax = hi95), alpha = 0.2) +
  geom_line(data = fc, aes(date, mean), linewidth = 1)
