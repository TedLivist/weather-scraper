require 'httparty'
require 'nokogiri'
require 'byebug'

def my_scraper
  url = "https://www.weather-forecast.com/locations/Paris/forecasts/latest"
  unparsed_page = HTTParty.get(url)
  parsed_page = Nokogiri::HTML(unparsed_page)
  byebug
end

my_scraper