require 'httparty'
require 'nokogiri'
require 'byebug'

def my_scraper
  url = "https://www.weather-forecast.com/locations/Lagos/forecasts/latest"
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

  puts "    " + parsed_page.css('span.show-for-medium-up').text + "\n"
  for i in weathers do
    puts "\n"
    puts i[:weather_title] + "\n" + i[:weather_description]
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
  # near_paris_table_header[second..last].each do |i|
  #   puts i.text
  # end


  # Weather forecast for places near #{Paris}
  puts parsed_page.css('h3.nearest-other-header').text << "\n"
  for i in near_paris_cities_data do
    puts "#{near_paris_table_header[0].text}: #{i.text}"
    puts "#{near_paris_table_header[1].text}: #{the_cities_data[s].text}"
    puts "#{near_paris_table_header[2].text}: #{the_cities_data[s + 1].text}"
    puts "#{near_paris_table_header[3].text}: #{the_cities_data[s + 2].text}"
    puts "#{near_paris_table_header[4].text}: #{the_cities_data[s + 3].text}"
    s += 4
    puts "\n"
  end
  # puts near_paris_cities_data[c_n_p].text
  # the_cities_data[s..e].each do |x|
  #   puts x.text
  # end
  # byebug

end

my_scraper