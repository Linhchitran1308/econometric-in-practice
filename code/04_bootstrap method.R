library(readxl)
library(boot)

df <- read_excel("data/Data_KON.xlsx")

boot_fn <- function(data, indices) {
  d <- data[indices, ]
  coef(lm(KP ~ KB + CP, data = d))
}

set.seed(123)
boot_res <- boot(df, boot_fn, R = 2000)

# Bootstrap confidence intervals
boot.ci(boot_res, type = "perc", index = 2)  # KB
boot.ci(boot_res, type = "perc", index = 3)  # CP
