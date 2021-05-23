require_relative './parsers'

class LocationWeather < Parsers
  attr_reader :weathers

  def initialize(city)
    @weathers = []
    super
  end

  def add_city_weather
    create_city_weather
  end

  private
  
  def create_city_weather
    the_city_weathers = parsed_page.css('td.b-forecast__table-description-cell--js')
    the_city_weathers.each do |the_city_weather|
      weather = {
        weather_title: the_city_weather.css('div.b-forecast__table-description-title').text,
        weather_description: the_city_weather.css('span.phrase').text
      }
      weathers << weather
    end
  end
end
