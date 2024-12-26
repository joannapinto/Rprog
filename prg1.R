library(dplyr)
library(ggplot2)
library(tidyr)

file_path <- "/Users/Joanna letica Pinto/OneDrive/Desktop/R/train.csv"
data <- read.csv(file_path)

# Step 2: Exploratory Data Analysis (EDA)
# Summary statistics 
summary_stats <- summary(data)
print(summary_stats)

# Data visualization
# For example, let's create a histogram for age
print(ggplot(data, aes(x = Age)) +
        geom_histogram(binwidth = 5, fill = "blue", color = "black") +
        labs(title = "Distribution of Age on Titanic",
             x = "Age",
             y = "Frequency"))

print(ggplot(data, aes(x = factor(Survived), fill = factor(Survived))) +
        geom_bar() +
        labs(title = "Number of Survivors on Titanic",
             x = "Survived",
             y = "Count") +
        scale_fill_manual(values = c("red", "green")))


# Identifying missing values
missing_values <- colSums(is.na(data))
print(missing_values)

# Cleaning the data
# Remove duplicates
data <- distinct(data)

# Removing missing values
data$Age[is.na(data$Age)] <- mean(data$Age, na.rm = TRUE)
missing_values <- colSums(is.na(data))
print(missing_values)

# Data manipulation operations
# Filtering: Select passengers with age greater than 18
adult_passengers <- filter(data, Age > 18)

# Sorting: Sort data by Fare in descending order
sorted_titanic <- arrange(data, desc(Fare))

# Merging datasets (if applicable)
# Example: If you have another dataset named "additional_data"
file_path <- "/Users/Joanna letica Pinto/OneDrive/Desktop/R/attach.csv"
A <- read.csv(file_path)

# Check column names in both datasets
print(colnames(data))
print(colnames(A))

# Merge based on 'PassengerId'
merged_data <- merge(data, A, by.x = "PassengerId", by.y = "PassengerId")
print(merged_data )

# Statistical analysis
# Example: Hypothesis testing (t-test)
# Check the assumptions (visualize the distribution of ages for each group)
print(boxplot(Age ~ Survived, data = data, col = c("red", "blue"), main = "Boxplot of Age by Survived"))

# Conduct t-test
t_test_result <- t.test(Age ~ Survived, data = data)

# Print the t-test result
print(t_test_result)

# Calculate the correlation coefficient between 'Age' and 'Fare'
correlation_coefficient <- cor(data$Age, data$Fare)

# Print the result
print(correlation_coefficient)





             
