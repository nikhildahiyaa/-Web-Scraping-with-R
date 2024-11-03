# Read the webpage
url <- "https://www.imdb.com/chart/top/"
webpage <- read_html(url)

# Scrape movie titles
titles <- webpage %>%
  html_nodes("tr.lister-item td.titleColumn a") %>%
  html_text()
titles <- head(titles, 10)

# Scrape movie release years
years <- webpage %>%
  html_nodes("tr.lister-item span.secondaryInfo") %>%
  html_text()
years <- head(years, 10)

# Scrape movie ratings
ratings <- webpage %>%
  html_nodes("tr.lister-item td.ratingColumn.imdbRating strong") %>%
  html_text()
ratings <- head(ratings, 10)

# Combine the scraped data into a data frame
movies_df <- tibble(
  Title = titles,
  ReleaseYear = years,
  Rating = ratings
)

# Print the data frame
print(movies_df)

library(rvest)
library(httr)

scrape_quotes <- function(url) {
  webpage <- read_html(url, user_agent("Mozilla/5.0"))
  
  quotes <- webpage %>%
    html_nodes(".quote .text") %>%
    html_attr("content")
  
  return(quotes)
}

base_url <- "http://quotes.toscrape.com/page/%d/"
all_quotes <- c()

for (i in 1:3) {
  url <- sprintf(base_url, i)
  quotes <- scrape_quotes(url)
  all_quotes <- c(all_quotes, quotes)
}

# Print all_quotes to see the result
print(all_quotes)

library(rvest)
library(httr)

scrape_quotes <- function(url) {
  webpage <- url %>%
    httr::GET(user_agent("Mozilla/5.0")) %>%
    httr::content(as = "text") %>%
    read_html()
  
  quotes <- webpage %>%
    html_nodes(".quote .text") %>%
    html_text()
  
  return(quotes)
}

base_url <- "http://quotes.toscrape.com/page/%d/"
all_quotes <- c()

for (i in 1:3) {
  url <- sprintf(base_url, i)
  quotes <- scrape_quotes(url)
  all_quotes <- c(all_quotes, quotes)
}

# Print all_quotes to see the result
print(all_quotes)

library(rvest)
library(httr)

scrape_quotes <- function(url) {
  webpage <- url %>%
    httr::GET(user_agent("Mozilla/5.0")) %>%
    httr::content(as = "text") %>%
    read_html()
  
  quotes <- webpage %>%
    html_nodes(".quoteText") %>%
    html_text()
  
  return(quotes)
}

base_url <- "https://www.goodreads.com/quotes?page=%d"
all_quotes <- c()

for (i in 1:3) {
  url <- sprintf(base_url, i)
  quotes <- scrape_quotes(url)
  all_quotes <- c(all_quotes, quotes)
}

# Print all_quotes to see the result
print(all_quotes)
library(rvest)
library(httr)

scrape_books <- function(url) {
  webpage <- url %>%
    httr::GET(user_agent("Mozilla/5.0")) %>%
    httr::content(as = "text") %>%
    read_html()
  
  titles <- webpage %>%
    html_nodes(".product_pod h3 a") %>%
    html_attr("title")
  
  prices <- webpage %>%
    html_nodes(".product_pod .price_color") %>%
    html_text()
  
  return(data.frame(Title = titles, Price = prices, stringsAsFactors = FALSE))
}

base_url <- "http://books.toscrape.com/catalogue/page-%d.html"
all_books <- data.frame(Title = character(), Price = character(), stringsAsFactors = FALSE)

for (i in 1:3) {
  url <- sprintf(base_url, i)
  books <- scrape_books(url)
  all_books <- rbind(all_books, books)
}

# Print all_books to see the result
print(all_books)


library(rvest)
library(httr)

# Define the base URL
main_url <- "http://books.toscrape.com"

# Scrape the main webpage
webpage <- main_url %>%
  httr::GET(user_agent("Mozilla/5.0")) %>%
  httr::content(as = "text") %>%
  read_html()

# Extract section URLs
section_urls <- webpage %>%
  html_nodes(".side_categories a") %>%
  html_attr("href")

# Convert relative URLs to absolute URLs
section_urls <- file.path(main_url, section_urls, fsep = "/")

# Print section_urls to see the result
print(section_urls)
scrape_books <- function(url) {
  webpage <- url %>%
    httr::GET(user_agent("Mozilla/5.0")) %>%
    httr::content(as = "text") %>%
    read_html()
  
  titles <- webpage %>%
    html_nodes(".product_pod h3 a") %>%
    html_attr("title")
  
  prices <- webpage %>%
    html_nodes(".product_pod .price_color") %>%
    html_text()
  
  return(data.frame(Title = titles, Price = prices, stringsAsFactors = FALSE))
}

all_books <- data.frame(Title = character(), Price = character(), Section = character(), stringsAsFactors = FALSE)

for (section_url in section_urls) {
  for (i in 1:3) {
    url <- gsub("index.html$", sprintf("page-%d.html", i), section_url)
    books <- scrape_books(url)
    books$Section <- basename(dirname(url))
    all_books <- rbind(all_books, books)
  }
}

# Print all_books to see the result
print(all_books)

library(rvest)
library(httr)

scrape_books <- function(url) {
  webpage <- url %>%
    httr::GET(user_agent("Mozilla/5.0")) %>%
    httr::content(as = "text") %>%
    read_html()
  
  titles <- webpage %>%
    html_nodes(".product_pod h3 a") %>%
    html_attr("title")
  
  prices <- webpage %>%
    html_nodes(".product_pod .price_color") %>%
    html_text()
  
  return(data.frame(Title = titles, Price = prices, stringsAsFactors = FALSE))
}

has_next_page <- function(url) {
  webpage <- url %>%
    httr::GET(user_agent("Mozilla/5.0")) %>%
    httr::content(as = "text") %>%
    read_html()
  
  next_page <- webpage %>%
    html_nodes(".next a") %>%
    html_attr("href")
  
  return(length(next_page) > 0)
}

all_books <- data.frame(Title = character(), Price = character(), Section = character(), stringsAsFactors = FALSE)

for (section_url in section_urls) {
  i <- 1
  while (TRUE) {
    url <- gsub("index.html$", sprintf("page-%d.html", i), section_url)
    
    # Check if the page exists before scraping
    if (!has_next_page(url) && i != 1) {
      break
    }
    
    books <- scrape_books(url)
    books$Section <- basename(dirname(url))
    all_books <- rbind(all_books, books)
    
    i <- i + 1
  }
}

# Print all_books to see the result
print(all_books)


