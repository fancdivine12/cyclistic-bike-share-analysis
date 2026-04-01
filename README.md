🚲 Cyclistic Bike-Share Analysis

Author: Sadé Stewart
Tools Used: R, tidyverse, ggplot2, lubridate
Project Type: Case Study (Google Data Analytics Capstone)

⸻

📌 Business Problem

Cyclistic wants to increase annual memberships.

Key Question:
How do casual riders and annual members use bikes differently, and how can Cyclistic convert casual riders into members?

⸻

📊 Data Source
	•	Divvy bike-share dataset (Jan–Apr 2022)
	•	Includes ride timestamps, duration, and user type

⸻

🧹 Data Cleaning & Preparation
	•	Combined multiple monthly datasets into one dataset
	•	Converted date/time columns to proper format
	•	Created a ride_length variable (minutes)
	•	Removed invalid rides (negative or zero duration)
	•	Extracted day_of_week and hour for analysis

⸻

🔍 Key Insights

1. Ride Behavior Differences
	•	Casual riders have longer average ride durations
	•	Members take shorter but more frequent rides

Interpretation:
Casual riders are more likely using bikes for leisure, while members are using bikes for commuting or routine travel.

⸻

2. Weekly Usage Patterns
	•	Casual riders peak on weekends
	•	Members ride consistently during weekdays

Interpretation:
Casual usage is recreational, while member usage aligns with work schedules.

⸻

3. Time of Day Trends
	•	Members ride more during morning and evening hours
	•	Casual riders ride more during midday and afternoon hours

Interpretation:
Members follow commute patterns, while casual riders ride during free time.


---

## 📈 Analysis & Visualizations

### Member vs Casual Usage
![Member vs Casual](member_vs_casual.png)

### Ride Length Distribution
![Ride Length](ride_length_boxplot.png)

### Usage by Day of Week
![Day of Week](day_of_week_usage.png)

### Time of Day Trends
![Time of Day](time_of_day_usage.png)

---

💡 Business Recommendations

1. Target Casual Riders with Weekend Campaigns
	•	Offer discounted memberships during weekends
	•	Introduce trial memberships during peak leisure times

⸻

2. Highlight Cost Savings
	•	Show how frequent riders can save money with memberships
	•	Use app notifications after long rides

⸻

3. Introduce Flexible Membership Options
	•	Offer weekend-only or part-time memberships
	•	Reduce commitment barriers for casual users

⸻

4. Convert High-Usage Casual Riders
	•	Identify users with long or frequent rides
	•	Provide personalized upgrade incentives

⸻

🧠 Conclusion

Casual riders and members differ in ride frequency, duration, and timing.
By targeting these behavioral differences, Cyclistic can increase conversions and grow membership revenue.

🚀 Skills Demonstrated
	•	Data cleaning and transformation
	•	Exploratory data analysis
	•	Data visualization (ggplot2)
	•	Business insight generation
	•	Data-driven decision making
