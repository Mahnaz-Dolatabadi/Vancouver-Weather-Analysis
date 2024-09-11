# Vancouver Weather Data Analysis

# Load required libraries
library(tidyverse)

# Load the dataset
weather_data <- read_csv("weatherstats_vancouver_daily.csv")

# Inspect the data
glimpse(weather_data)

# Convert date column to Date type if necessary
weather_data$date <- as.Date(weather_data$date)

# Plot Temperature Trends
temp_plot <- ggplot(weather_data, aes(x = date)) +
  geom_line(aes(y = temp_max, color = "Max Temp")) +
  geom_line(aes(y = temp_min, color = "Min Temp")) +
  labs(title = "Temperature Trends in Vancouver",
       x = "Date", y = "Temperature (°C)") +
  scale_color_manual(values = c("Max Temp" = "red", "Min Temp" = "blue")) +
  theme_minimal()

# Display the temperature plot
print(temp_plot)

# Save the temperature trends plot as a PNG file
ggsave("temperature_trends_vancouver.png", plot = temp_plot, width = 8, height = 6)

# Plot Precipitation Trends
precip_plot <- ggplot(weather_data, aes(x = date, y = precipitation)) +
  geom_line(color = "blue") +
  labs(title = "Precipitation Trends in Vancouver",
       x = "Date", y = "Precipitation (mm)") +
  theme_minimal()

# Display the precipitation plot
print(precip_plot)

# Save the precipitation trends plot as a PNG file
ggsave("precipitation_trends_vancouver.png", plot = precip_plot, width = 8, height = 6)

# Summary statistics for temperatures and precipitation
summary_stats <- weather_data %>%
  summarize(
    avg_max_temp = mean(temp_max, na.rm = TRUE),
    avg_min_temp = mean(temp_min, na.rm = TRUE),
    total_precipitation = sum(precipitation, na.rm = TRUE)
  )

# Print summary statistics
print(summary_stats)
