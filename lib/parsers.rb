class Parsers

  def initialize(url)
    @url = url
  end

  url = "https://www.weather-forecast.com/locations/Abuja/forecasts/latest"
  unparsed_page = HTTParty.get(url)
  parsed_page = Nokogiri::HTML(unparsed_page)
end