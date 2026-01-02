# 02_ols_diagnostics.R
library(readxl)
library(lmtest)
library(sandwich)
library(car)

df <- read_excel("data/Data_KON.xlsx")

# OLS model
m1 <- lm(KP ~ KB + CP, data = df)
summary(m1)

# Diagnostic plots
par(mfrow = c(2, 2))
plot(m1)

# RESET test
resettest(m1)

# Breusch–Pagan (heteroskedasticity)
bptest(m1)

# Breusch–Godfrey (autocorrelation, monthly data → lag 12)
bgtest(m1, order = 12)

# Robust (Newey–West) standard errors
coeftest(m1, vcov = NeweyWest(m1, lag = 12, prewhite = FALSE))
