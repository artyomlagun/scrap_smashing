# frozen_string_literal: true

require "open-uri"
require "nokogiri"
require "byebug"

class ScrapperForPage
  include Constants

  def initialize(url, resolution)
    @url = url.chomp("/")
    @resolution = resolution
  end

  # rubocop:disable Security/Open
  # Due to https://github.com/ruby/open-uri/commit/53862fa35887a34a8060aebf2241874240c2986a
  def perform
    html = URI.open(@url)

    # Parse the page with Nokogiri
    doc = Nokogiri::HTML(html)

    # Use CSS selectors to find all "a" elements with href attribute that contains "pattern"
    links = doc.css("a[href*='#{PATTERN_FOR_IMAGE_URL}']")

    # Return an array of links images with the resolution
    links.map do |link|
      next unless link["href"].include?(@resolution)

      link["href"]
    end.compact
  end
  # rubocop:enable Security/Open
end
