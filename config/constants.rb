# frozen_string_literal: true

module Constants
  SMASHING_SEARCH_URL = "https://5raji8u6uh-dsn.algolia.net/1/indexes/smashingmagazine/query?x-algolia-agent=Algolia%20for%20JavaScript%20(4.9.1)%3B%20Browser"

  HUMAN_MONTHS = {
    "01": "January",
    "02": "February",
    "03": "March",
    "04": "April",
    "05": "May",
    "06": "June",
    "07": "July",
    "08": "August",
    "09": "September",
    "10": "October",
    "11": "November",
    "12": "December",
  }

  user_agent = "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko)"
  user_agent += " Version/17.1.2 Safari/605.1.15"

  SMASHING_HEADERS = {
    "Accept": "*/*",
    "Accept-Encoding": "gzip, deflate, br",
    "Content-Type": "application/x-www-form-urlencoded",
    "User-Agent": user_agent,
    "x-algolia-api-key": "c996d58ec6bf7789719889b76dc89aa1",
    "x-algolia-application-id": "5RAJI8U6UH",
  }

  DATE_PATTERN = /^\d{2}\d{4}$/
  MONTH_PATTERN = /^\d{2}/
  YEAR_PATTERN = /\d{4}$/

  PATTERN_FOR_IMAGE_URL = "https://www.smashingmagazine.com/files/wallpapers"

  LOG_FILE_PATH = "log/smashing.log"
end
