# Load necessary libraries
library(dplyr)

# Read datasets from different files or sources
dataset1 <- read.csv("/Users/Joanna letica Pinto/OneDrive/Desktop/R/sales.csv")
dataset2 <- read.csv("/Users/Joanna letica Pinto/OneDrive/Desktop/R/salary.csv")

# Merge or join datasets based on common variables or keys
merged_data <- merge(dataset1, dataset2, by = "ID")

# Perform aggregation operations by groups or categories
aggregated_data <- merged_data %>%
  group_by(Gender) %>%
  summarise(
    total_salary = sum(Salary),
    average_age = mean(Age),
    count = n()
  )

# Filter the data based on specific conditions or criteria
filtered_data <- merged_data %>%
  filter(Age > 25)

# Create new variables or transform existing variables using functions or mathematical operations
transformed_data <- merged_data %>%
  mutate(
    doubled_salary = Salary * 2,
    seniority = ifelse(Age > 28, "Senior", "Junior")
  )

# Print the results
print("Merged Data:")
print(merged_data)
print("Aggregated Data:")
print(aggregated_data)
print("Filtered Data:")
print(filtered_data)
print("Transformed Data:")
print(transformed_data)