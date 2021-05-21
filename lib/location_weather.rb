require_relative './parsers.rb'

class LocationWeather
  attr_reader :weathers, :requested_weather
  def initialize(city)
    @weathers = Array.new
    @requested_weather = Parsers.new(city)
  end

  def some_location
    paris_weathers = @requested_weather.parsed_page.css('td.b-forecast__table-description-cell--js')
    paris_weathers.each do |paris_weather|
      weather = {
        weather_title: paris_weather.css('div.b-forecast__table-description-title').text,
        weather_description: paris_weather.css('span.phrase').text
      }
      weathers << weather
    end
  end
end

new_inst = LocationWeather.new('Lagos')
puts new_inst.requested_weather.is_a?(Parsers)