# 01_data_exploration.R
library(readxl)
library(tidyverse)

df <- read_excel("data/Data_KON.xlsx")

# Basic overview
glimpse(df)
summary(df)

# Missing values
colSums(is.na(df))

# Correlation (numeric columns only)
num_df <- df %>% select(where(is.numeric))
cor_mat <- cor(num_df, use = "complete.obs")
print(round(cor_mat, 3))

# Quick pairs plot (base R) for numeric columns
pairs(num_df, main = "Pairs plot: numeric variables")
