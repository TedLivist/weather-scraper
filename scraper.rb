require 'httparty'
require 'nokogiri'
require 'byebug'

def my_scraper
  url = "https://www.weather-forecast.com/locations/Paris/forecasts/latest"
  unparsed_page = HTTParty.get(url)
  parsed_page = Nokogiri::HTML(unparsed_page)
  weathers = Array.new
  paris_weathers = parsed_page.css('td.b-forecast__table-description-cell--js')
  paris_weathers.each do |paris_weather|
    weather = {
      weather_title: paris_weather.css('div.b-forecast__table-description-title').text,
      weather_description: paris_weather.css('span.phrase').text
    }
    weathers << weather
  end
  byebug
end

my_scraper