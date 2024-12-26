# Load necessary libraries
library(ggplot2)
library(dplyr)

# Read the dataset from CSV file
titanic <- read.csv("/Users/Joanna letica Pinto/OneDrive/Desktop/R/train.csv")

# Check for missing values
sum(is.na(titanic))

# Remove rows with missing values
titanic <- na.omit(titanic)

# Perform linear regression
lm_model <- lm(Age ~ Fare + Pclass, data = titanic)

# Print coefficients and intercept
print(coef(lm_model))
print(coef(lm_model)[1])  # This prints the intercept

# Evaluate the model's goodness-of-fit
summary(lm_model)

# Plot regression line and residuals
print(ggplot(titanic, aes(x = Fare, y = Age)) +
        geom_point() +
        geom_smooth(method = "lm", se = FALSE, color = "blue") +
        ggtitle("Linear Regression Analysis: Age vs Fare") +
        xlab("Fare") +
        ylab("Age") +
        theme_minimal())

# Plot residuals
print(ggplot(titanic, aes(x = fitted(lm_model), y = residuals(lm_model))) +
        geom_point() +
        geom_hline(yintercept = 0, linetype = "dashed", color = "red") +
        ggtitle("Residuals Plot") +
        xlab("Fitted values") +
        ylab("Residuals") +
        theme_minimal())
