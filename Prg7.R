# Load necessary library
library(dplyr)

# Read datasets
sales_data <- read.csv("/Users/Joanna letica Pinto/OneDrive/Desktop/R/sales_new.csv")
customer_data <- read.csv("/Users/Joanna letica Pinto/OneDrive/Desktop/R/customer.csv")

# Print the datasets
print("Sales Data:")
print(sales_data)
print("Customer Data:")
print(customer_data)

# Merge datasets based on common variable
merged_data <- merge(sales_data, customer_data, by.x = "Name", by.y = "Name", all = TRUE)

# Calculate total sales amount
merged_data <- merged_data %>%
  mutate(Total_Sales = Quantity * Price)

# Calculate total sales amount by country
sales_by_country <- merged_data %>%
  group_by(Country) %>%
  summarise(Total_Sales = sum(Total_Sales))

# Filter data for USA customers
usa_customers <- merged_data %>%
  filter(Country == "USA")

# Print the results
print("Merged Data:")
print(merged_data)
print("Sales by Country:")
print(sales_by_country)
print("USA Customers:")
print(usa_customers)