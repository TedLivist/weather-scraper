require_relative './lib/parsers.rb'
require_relative './lib/location_weather.rb'

def my_scraper
  the_city = gets.chomp
  the_parse = Parsers.new(the_city)
  main_weather = LocationWeather.new(the_city)

  # paris_weathers = the_parse.parsed_page.css('td.b-forecast__table-description-cell--js')
  # paris_weathers.each do |paris_weather|
  #   weather = {
  #     weather_title: paris_weather.css('div.b-forecast__table-description-title').text,
  #     weather_description: paris_weather.css('span.phrase').text
  #   }
  #   main_weather.weathers << weather
  # end
  main_weather.some_location

  puts "    " + the_parse.parsed_page.css('span.show-for-medium-up').text + "\n"
  for i in main_weather.weathers do
    puts "\n"
    puts i[:weather_title] + "\n" + i[:weather_description]
  end

  near_paris_table_header = the_parse.parsed_page.css('table.other_places.guide th')
  
  near_paris_cities_data = the_parse.parsed_page.css('table.other_places.guide tr td b')
  the_cities_data = the_parse.parsed_page.css('table.other_places tr td span.phrase')
  
  s = 0

  # Weather forecast for places near #{Paris}
  puts the_parse.parsed_page.css('h3.nearest-other-header').text << "\n"
  for i in near_paris_cities_data do
    puts "#{near_paris_table_header[0].text}: #{i.text}"
    for x in near_paris_table_header[1..-1] do
       puts "#{x.text}: #{the_cities_data[s].text}"
       s += 1
    end
    puts "\n"
  end

end

my_scraper