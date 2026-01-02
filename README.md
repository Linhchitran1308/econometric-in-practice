# Econometric Analysis of Economic Sentiment

## Overview
This project presents an applied econometric analysis of economic sentiment indicators.
The objective is to model, validate, and forecast the dynamics of economic sentiment
using regression, dynamic, and nonlinear time-series methods in R.

## Data
The analysis uses an economic sentiment dataset containing:
- KP – main sentiment indicator (dependent variable)
- KB, CP – explanatory sentiment indicators
- Year – time index

The dataset is provided as an Excel file and is used consistently across all scripts.

## Methods
The project covers the following methods:
- Exploratory data analysis and visualization
- OLS regression and diagnostic testing
- Nonparametric kernel methods
- Bootstrap methods
- ADL dynamic modeling with recursive forecasting
- Structural break and outlier analysis
- Markov-switching regression models
- Monte Carlo simulation for time-series properties

## Repository Structure
- `01_dataexploration.R` – data exploration and summary statistics  
- `02_ols_diagnostic.R` – regression estimation and diagnostics  
- `03_nonparametricmethod.R` – nonparametric analysis  
- `04_bootstrap method.R` – bootstrap inference  
- `05_adl model and forecasting.R` – dynamic modeling and forecasting  
- `06_structural break outlier.R` – structural break and influence analysis  
- `07_markov_switching.R` – regime-switching model  
- `08_montecarlo_simulation.R` – Monte Carlo simulation  
- `Data_KON.xlsx` – dataset  
- `economic sentiment reports.docx` – technical report  

## How to Run
1. Clone or download the repository
2. Open the project in RStudio
3. Run the scripts in numerical order (01 → 08)

## Author
Linh Chi Tran
