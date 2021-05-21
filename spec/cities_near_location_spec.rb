require_relative '../lib/cities_near_location'

describe CitiesNearLocation do
  describe '#initialize' do
    new_instance = CitiesNearLocation.new('Paris')
    it 'header of cities cannot be zero' do
      expect(new_instance.other_cities_table_header.count).to eql(5)
    end

    it 'name of cities cannot be zero' do
      expect(new_instance.other_cities_name.count).to eql(5)
    end

    it 'weather data of cities cannot be zero' do
      expect(new_instance.other_cities_weather_data.count).to eql(20)
    end
  end
end
