require_relative '../lib/parsers.rb'
require_relative '../lib/location_weather.rb'
require_relative '../lib/cities_near_location.rb'

def my_scraper
  begin
    puts "Put in the city you'd like to find its weather forecast"
    the_city = gets.chomp
    raise StandardError, the_city if the_city == ""
  rescue StandardError
    puts "City cannot be empty"
    retry
  end
  city_weather = LocationWeather.new(the_city)
  nearby_cities = CitiesNearLocation.new(the_city)

  city_weather.add_city_weather # This is run so that an array of weather forecasts can be created

  # Weather Forecast for requested location
  puts ""
  puts "\t\t" + city_weather.requested_weather.parsed_page.css('span.show-for-medium-up').text + "\n"
  for i in city_weather.weathers do
    puts "\n"
    puts i[:weather_title] + "\n" + i[:weather_description]
  end

  # Weather Forecast for cities near requested location
  s = 0
  puts nearby_cities.other_cities_parse.parsed_page.css('h3.nearest-other-header').text << "\n"
  for i in nearby_cities.other_cities_name do
    puts "#{nearby_cities.other_cities_table_header[0].text}: #{i.text}"
    for x in nearby_cities.other_cities_table_header[1..-1] do
       puts "#{x.text}: #{nearby_cities.other_cities_weather_data[s].text}"
       s += 1
    end
    puts "\n"
  end
end

my_scraper