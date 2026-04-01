# =========================
# Cyclistic Bike-Share Analysis
# Author: Sade Stewart
# =========================

# Install packages if needed
install.packages("tidyverse")
install.packages("lubridate")

# Load libraries
library(tidyverse)
library(lubridate)

# =========================
# STEP 1: Load Data
# =========================

jan <- read_csv("202201-divvy-tripdata.csv")
feb <- read_csv("202202-divvy-tripdata.csv")
mar <- read_csv("202203-divvy-tripdata.csv")
apr <- read_csv("202204-divvy-tripdata.csv")

# =========================
# STEP 2: Combine Data
# =========================

all_data <- bind_rows(jan, feb, mar, apr)

# =========================
# STEP 3: Clean Data
# =========================

# Convert to datetime
all_data <- all_data %>%
  mutate(
    started_at = ymd_hms(started_at),
    ended_at = ymd_hms(ended_at)
  )

# Create ride length (minutes)
all_data <- all_data %>%
  mutate(
    ride_length = as.numeric(difftime(ended_at, started_at, units = "mins"))
  )

# Remove invalid rides
all_data <- all_data %>%
  filter(ride_length > 0)

# Extract day of week
all_data <- all_data %>%
  mutate(
    day_of_week = wday(started_at, label = TRUE)
  )

# =========================
# STEP 4: Analysis
# =========================

# Avg ride length by user type
ride_summary <- all_data %>%
  group_by(member_casual) %>%
  summarise(avg_ride_length = mean(ride_length, na.rm = TRUE))

print(ride_summary)

# Ride count by day of week
day_usage <- all_data %>%
  group_by(member_casual, day_of_week) %>%
  summarise(count = n())

print(day_usage)

# =========================
# STEP 5: Visualizations
# =========================

# 1. Member vs Casual Usage
ggplot(all_data, aes(x = member_casual, fill = member_casual)) +
  geom_bar() +
  labs(title = "Member vs Casual Usage")

ggsave("member_vs_casual.png")

# 2. Day of Week Usage
ggplot(day_usage, aes(x = day_of_week, y = count, fill = member_casual)) +
  geom_col(position = "dodge") +
  labs(title = "Usage by Day of Week")

ggsave("day_of_week_usage.png")

# 3. Ride Length Boxplot
ggplot(all_data, aes(x = member_casual, y = ride_length, fill = member_casual)) +
  geom_boxplot() +
  labs(title = "Ride Length Distribution")

ggsave("ride_length_boxplot.png")

# 4. Time of Day Usage
all_data <- all_data %>%
  mutate(hour = hour(started_at))

ggplot(all_data, aes(x = hour, fill = member_casual)) +
  geom_histogram(binwidth = 1, position = "identity", alpha = 0.6) +
  labs(title = "Time of Day Usage")

ggsave("time_of_day_usage.png")
