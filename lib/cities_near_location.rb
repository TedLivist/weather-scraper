require_relative './parsers.rb'

class CitiesNearLocation

  attr_reader :other_cities_table_header, :other_cities_weather_data, :other_cities_name, :other_cities_parse

  def initialize(city)
    @other_cities_parse = Parsers.new(city)
    @other_cities_table_header = @other_cities_parse.parsed_page.css('table.other_places.guide th')
    @other_cities_name = @other_cities_parse.parsed_page.css('table.other_places.guide tr td b')
    @other_cities_weather_data = @other_cities_parse.parsed_page.css('table.other_places tr td span.phrase')
  end
end