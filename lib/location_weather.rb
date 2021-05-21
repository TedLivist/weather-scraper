require_relative './parsers.rb'

class LocationWeather
  attr_reader :weathers, :requested_weather
  def initialize(city)
    @weathers = Array.new
    @requested_weather = Parsers.new(city)
  end

  def some_location
    the_city_weathers = @requested_weather.parsed_page.css('td.b-forecast__table-description-cell--js')
    the_city_weathers.each do |the_city_weather|
      weather = {
        weather_title: the_city_weather.css('div.b-forecast__table-description-title').text,
        weather_description: the_city_weather.css('span.phrase').text
      }
      weathers << weather
    end
  end
end
