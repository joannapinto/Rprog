# Load necessary libraries
library(rvest)

url <- "https://nmamit.nitte.edu.in/department-AI&DS.php#Faculty"

html_content <- read_html(url)

name_xpath <-'/html/body/div/section[5]/div/div/div/div/a/div/h3'
email_xpath <-'/html/body/div[1]/section[5]/div/div/div/div/div/div/div/div[1]/div/div[2]/ul/li[2]/text()'

names <- html_content %>%
  html_nodes(xpath = name_xpath) %>%
  html_text() %>%
  trimws() 
emails <- html_content %>%
  html_nodes(xpath = email_xpath) %>%
  html_text() %>%
  trimws() 

faculty_data <- data.frame(Name = names, Email = emails)
# Print the extracted data
print(faculty_data)
# Save the extracted data to a CSV file
write.csv(faculty_data, "faculty_data.csv", row.names = FALSE)