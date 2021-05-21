require_relative './parsers.rb'

class CitiesNearLocation
  def initialize(city)
    @other_cities_parse = Parsers.new(city)
    @cities_near_location_header = @other_cities_parse.parsed_page.css('table.other_places.guide th')
    @cities_near_location = @other_cities_parse.parsed_page.css('table.other_places.guide tr td b')
    @the_cities_weather = @other_cities_parse.parsed_page.css('table.other_places tr td span.phrase')
  end
end