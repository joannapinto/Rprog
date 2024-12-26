library(ggplot2)
library(dplyr)

# Read the dataset from CSV file
data <- read.csv("/Users/Joanna letica Pinto/OneDrive/Desktop/R/marks.csv")  # Replace "your_dataset.csv" with the actual filename

# Check for missing values
sum(is.na(data))

# Remove rows with missing values
data <- na.omit(data)

# Perform linear regression
lm_model <- lm(External~ Internal, data = data)

# Print coefficients and intercept
print(coef(lm_model))
print(coef(lm_model)[1])  # This prints the intercept

# Evaluate the model's goodness-of-fit
summary(lm_model)

# Plot regression line and residuals
print(ggplot(data, aes(x = Internal, y = External)) +
        geom_point() +
        geom_smooth(method = "lm", se = FALSE, color = "blue") +
        ggtitle("Linear Regression Analysis: External Marks vs Internal Marks") +
        xlab("Internal Marks") +
        ylab("External Marks") +
        theme_minimal())

# Plot residuals
print(ggplot(data, aes(x = fitted(lm_model), y = residuals(lm_model))) +
        geom_point() +
        geom_hline(yintercept = 0, linetype = "dashed", color = "red") +
        ggtitle("Residuals Plot") +
        xlab("Fitted values") +
        ylab("Residuals") +
        theme_minimal())
