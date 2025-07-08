# Load libraries and Suppress package startup messages
suppressPackageStartupMessages({
  library(dplyr)
  library(readr)
  library(lubridate)
})

# Load dataset
covid_data <- read_csv("data/owid-covid-data.csv", show_col_types = FALSE) # Set to true to see tips

# Keep only necessary columns
covid_clean <- covid_data %>%
  select(location, date, total_cases, new_cases, total_deaths, new_deaths,
         total_vaccinations, people_vaccinated, stringency_index, population) %>%
  filter(!is.na(location) & !is.na(date)) %>%
  mutate(date = ymd(date))  # Convert to Date object

# Optional: Filter for a few countries to start (e.g., US, India, Brazil)
covid_filtered <- covid_clean %>%
  filter(location %in% c("United States", "India", "Brazil"))

# Export for Tableau use
write_csv(covid_filtered, "./outputs/cleaned_covid_data.csv")
