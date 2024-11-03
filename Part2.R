# Load required packages
library(rvest)
library(magrittr)
library(tidyverse)

# Seting the URL
url <- "http://www.sfu.ca/~haoluns/forecast.html"

# Scraping the weather data
web_content <- read_html(url)

day <- web_content %>%
  html_nodes(".tombstone-container .period-name") %>%
  html_text(trim = TRUE)

short_desc <- web_content %>%
  html_nodes(".tombstone-container .short-desc") %>%
  html_text(trim = TRUE)

temp <- web_content %>%
  html_nodes(".tombstone-container .temp") %>%
  html_text(trim = TRUE)

# Processing the weather data
n <- length(day)

#tibble (table)
tbl <- tibble(
  period = seq(from = 0, to = n - 1, by = 1),
  day = day,
  short_desc = short_desc,
  temp = temp
)

write.table(tbl, "301449046.csv", sep = ",", row.names = F, col.names = F)

