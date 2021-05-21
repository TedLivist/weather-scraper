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
  # near_paris_table_header.each do |near_paris_location_header|
  #   puts "| #{near_paris_location_header.text} |"
  # end
  
  near_paris_cities_data = parsed_page.css('table.other_places.guide tr td b')
  the_cities_data = parsed_page.css('table.other_places tr td span.phrase')
  # print the_cities_data
  c_n_p = 1
  s = 0
  e = 3
  for i in near_paris_cities_data do
    puts i.text
    the_cities_data[s..e].each do |x|
      puts x.text
    end
    s += 4
    e += 4
  end
  # puts near_paris_cities_data[c_n_p].text
  # the_cities_data[s..e].each do |x|
  #   puts x.text
  # end
  # byebug

end

my_scraper