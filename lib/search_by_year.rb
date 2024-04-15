# frozen_string_literal: true

require "uri"
require "net/http"
require "json"

class SearchByYear
  include Constants

  attr_accessor :month, :year

  def initialize(month, year)
    @month = month
    @year = year
  end

  # make request to the site with passed year and human month name
  # return the response
  def perform
    response = make_request

    return {} unless response.is_a?(Net::HTTPSuccess)

    JSON.parse(response.body)
  end

  private

  def make_request
    url = URI(SMASHING_SEARCH_URL)
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true

    request = Net::HTTP::Post.new(url)
    request.body = query.to_json
    SMASHING_HEADERS.each { |key, value| request[key] = value }

    http.request(request)
  end

  def query
    {
      "query": "#{month} #{year}",
      "hitsPerPage": 15,
      "page": 0,
    }
  end
end
