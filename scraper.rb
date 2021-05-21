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

  near_paris_table_header = parsed_page.css('table.other_places.guide th')
  near_paris_table_header.each do |near_paris_location_header|
    puts "| #{near_paris_location_header.text} |"
  end
  
  # near_paris_cities_data = parsed_page.css('table.other_places.guide td b')
  # print near_paris_cities_data
  byebug

end

my_scraper