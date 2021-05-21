require_relative './parsers'

class LocationWeather
  attr_reader :weathers, :requested_weather

  def initialize(city)
    @weathers = []
    @requested_weather = Parsers.new(city)
  end

  def add_city_weather
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
