
# Web Scraping with R: Final Project for STAT 260/261

This project demonstrates web scraping techniques in R, specifically aimed at extracting weather forecast data from a specified website and presenting it in a structured format. The project is divided into two main parts: a tutorial on web scraping in R and a practical implementation to scrape weather forecast data from a given URL.

## Table of Contents
- [Introduction](#introduction)
- [Project Structure](#project-structure)
- [Installation](#installation)
- [Usage](#usage)
- [Files](#files)
- [Contributing](#contributing)
- [License](#license)

## Introduction
Web scraping is the process of extracting data from websites. This project covers the fundamentals of web scraping using R with the `rvest`, `httr`, and `tidyverse` packages. It includes both a written tutorial and an implementation for scraping a weather forecast table.

## Project Structure
The project is divided into two parts:
1. **Tutorial**: A guide on how to perform web scraping using R, covering basics such as setting up the environment, inspecting web pages, and scraping multiple types of data.
2. **Implementation**: An R script that scrapes weather forecast data from a specified webpage and saves it to a CSV file.

## Installation
To run this project, you will need:
- **R** installed on your system. [Download R](https://cran.r-project.org/)
- Required R packages:
  ```r
  install.packages(c("rvest", "httr", "magrittr", "tidyverse", "janitor"))
  ```

## Usage
1. Clone this repository to your local machine.
   ```bash
   git clone https://github.com/your-username/your-repo-name.git
   cd your-repo-name
   ```

2. Run the R script to scrape the weather data:
   ```r
   source("ExtraProject.R")
   source("Part2.R")
   ```
   
   The script will save the weather data to a CSV file named after your student ID.

## Files
- **FinalProject_STAT260 updated.pdf**: PDF file describing the final project requirements and guidelines.
- **ExtraProject.R**: R script containing the tutorial part with examples of web scraping.
- **Part2.R**: R script that implements the web scraper for the weather forecast, extracts the required data, and saves it as a CSV file.
- **titles.csv**: Sample CSV file with scraped data for demonstration.

## Example Output
The final CSV file will contain the following columns:
- `period`: The time of day or day of the week for the forecast.
- `short_desc`: A brief description of the weather (e.g., "Mostly Sunny").
- `temp`: The high or low temperature with units (e.g., "High: 57 °F").

Example:
| Period         | Short Description | Temperature |
|----------------|-------------------|-------------|
| Today          | Mostly Sunny      | High: 53°F  |
| Tonight        | Clear and Breezy  | Low: 42°F   |
| Wednesday      | Sunny             | High: 57°F  |

## Contributing
Contributions are welcome! Please submit a pull request with your updates.

## License
This project is for educational purposes and does not require a license.

---

This README file is designed to help users understand the purpose, setup, and usage of this project.
