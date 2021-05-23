require 'httparty'
require 'nokogiri'
require 'byebug'

class Parsers
  attr_reader :parsed_page, :url, :unparsed_page

  def initialize(city)
    @url = "https://www.weather-forecast.com/locations/#{city}/forecasts/latest"
    @unparsed_page = HTTParty.get(@url)
    @parsed_page = Nokogiri::HTML(@unparsed_page)
  end
end
