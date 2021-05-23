require_relative '../lib/cities_near_location'

describe CitiesNearLocation do
  describe '#initialize' do
    new_instance = CitiesNearLocation.new('Paris')
    unknown_forecast = CitiesNearLocation.new('Santorini')
    context 'when city forecast is retrieved' do
      it 'cities headers cannot be empty' do
        expect(new_instance.other_cities_table_header.count).to eql(5)
      end

      it 'cities names cannot be empty' do
        expect(new_instance.other_cities_name.count).to eql(5)
      end

      it 'cities weather data cannot be empty' do
        expect(new_instance.other_cities_weather_data.count).to eql(20)
      end
    end

    context 'when city forecast cannot be retrieved' do
      it 'cities headers should be empty' do
        expect(unknown_forecast.other_cities_table_header.count).to eql(0)
      end

      it 'cities names should be empty' do
        expect(unknown_forecast.other_cities_name.count).to eql(0)
      end

      it 'cities weather data should be empty' do
        expect(unknown_forecast.other_cities_weather_data.count).to eql(0)
      end
    end
  end
end
