# frozen_string_literal: true

require "logger"
require_relative "lib/smashing_file"

class Smashing
  include Constants

  attr_accessor :date, :resolution, :logger

  def initialize(date, resolution)
    @date = date
    @resolution = resolution
    @logger = Logger.new(LOG_FILE_PATH)
  end

  def run
    logger.info("===Started process the request for date #{date} and resolution #{resolution}")

    validate_month
    search_response = search_data_by_month_and_year
    links_to_images = scrap_pages_for_images(search_response["hits"])
    download_images(links_to_images)

    logger.info("===Finished process the request for date #{date} and resolution #{resolution}")
  rescue => e
    logger.error("Error: #{e.message}")
    logger.error(e.backtrace.join("\n"))
  end

  private

  def search_data_by_month_and_year
    # make request to the site through SearchByYear class
    logger.info("Search data by month and year started")
    search_response = SearchByYear.new(month, year).perform
    logger.info("Search data by month and year started")

    search_response
  end

  def scrap_pages_for_images(pages)
    return [] if pages.empty?

    # scrap pages through scrapper_for_page class
    logger.info("Scraping images started")
    scrapped_images = pages.map { |page| ScrapperForPage.new(page["url"], resolution).perform }.flatten
    logger.info("Scraping images finished")

    scrapped_images
  end

  def download_images(links)
    return if links.empty?

    # download images through download_image class
    logger.info("Downloading images started")
    links.each do |link|
      logger.info("#{Time.now} -> Downloading image #{link}")
      DownloadImage.new(date, resolution, link).perform
    end
    logger.info("Downloading images finished")
  end

  def validate_month
    if month.to_i > 12 || month.to_i < 1
      puts "Invalid month"
      return
    end

    if year.to_i < 2000 || year.to_i > Time.now.year
      puts "Invalid year"
      return
    end
  end

  def month
    date.scan(MONTH_PATTERN).first
  end

  def year
    date.scan(YEAR_PATTERN).first
  end
end
