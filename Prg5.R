library(ggplot2)
library(dplyr)
library(plotly)

titanic <- read.csv("/Users/Joanna letica Pinto/OneDrive/Desktop/R/train.csv")

# Convert factor levels
titanic$Survived <- factor(titanic$Survived, levels = c("0", "1"))

# Bar chart showing count of survivors by passenger class
bar_plot <- ggplot(titanic, aes(x = factor(Pclass), fill = factor(Survived))) +
  geom_bar(position = "dodge") +
  labs(title = "Survivors by Passenger Class",
       x = "Passenger Class",
       y = "Count",
       fill = "Survived") +
  scale_fill_manual(values = c("0" = "red", "1" = "blue"))  # Ensure consistent levels with the factor

# Line plot showing age distribution of passengers
line_plot <- ggplot(titanic, aes(x = Age, y = ..density..)) +
  geom_density(fill = "blue", alpha = 0.5) +
  labs(title = "Age Distribution of Passengers",
       x = "Age",
       y = "Density")

# Scatter plot showing fare vs age with color indicating survival status
scatter_plot <- ggplot(titanic, aes(x = Age, y = Fare, color = factor(Survived))) +
  geom_point() +
  labs(title = "Fare vs Age",
       x = "Age",
       y = "Fare",
       color = "Survived") +
  scale_color_manual(values = c("0" = "red", "1" = "blue"))  # Ensure consistent levels with the factor

#heatmap
heatmap <- ggplot(titanic, aes(x = Pclass, y = Survived)) +
  stat_bin_2d(bins = 10, aes(fill = ..count..)) +
  labs(title = "Titanic Survival Heatmap", x = "Pclass", y = "Survived", fill = "Frequency") +
  scale_fill_continuous(name = "Frequency", low = "white", high = "blue") +
  theme_minimal()


# Step 3: Create interactive visualizations using plotly
# Interactive bar chart
interactive_bar_plot <- ggplotly(bar_plot)
interactive_line_plot <- ggplotly(line_plot)
interactive_scatter_plot <- ggplotly(scatter_plot)
interactive_heat_plot <- ggplotly(heatmap)

# Step 4: Export interactive visualizations
# Export visualizations to png files
ggsave("bar_plot.png", plot = bar_plot, width = 8, height = 6)
ggsave("line_plot.png", plot = line_plot, width = 8, height = 6)
ggsave("scatter_plot.png", plot = scatter_plot, width = 8, height = 6)
ggsave("titanic_heatmap_ggplot.png", heatmap, width = 8, height = 6)

# Export plotly interactive visualizations to HTML files
htmlwidgets::saveWidget(interactive_bar_plot, "interactive_bar_plot.html", selfcontained = TRUE)
htmlwidgets::saveWidget(interactive_line_plot, "interactive_line_plot.html", selfcontained = TRUE)
htmlwidgets::saveWidget(interactive_scatter_plot, "interactive_scatter_plot.html", selfcontained = TRUE)
htmlwidgets::saveWidget(interactive_heat_plot, file = "titanic_heatmap.html")

                        