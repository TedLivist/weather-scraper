require_relative './parsers'

class CitiesNearLocation < Parsers
  attr_reader :other_cities_table_header, :other_cities_weather_data, :other_cities_name, :other_cities_parse

  def initialize(city)
    super
    @other_cities_table_header = parsed_page.css('table.other_places.guide th')
    @other_cities_name = parsed_page.css('table.other_places.guide tr td b')
    @other_cities_weather_data = parsed_page.css('table.other_places tr td span.phrase')
  end
end
