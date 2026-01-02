library(readxl)
library(np)

df <- read_excel("data/Data_KON.xlsx")

# Kernel density of KP
plot(density(df$KP), main = "Kernel density of KP", xlab = "KP")

# Kernel regression: KP ~ KB
bw <- npregbw(KP ~ KB, data = df)
np_model <- npreg(bw)

summary(np_model)
plot(np_model, main = "Nonparametric regression: KP ~ KB")
