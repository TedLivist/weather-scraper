require_relative '../lib/location_weather'

describe LocationWeather do
  new_instance = LocationWeather.new('Lagos')
  describe '#initialize' do
    context 'when instantiated' do
      it 'also creates an instance of Parsers class' do
        expect(new_instance.requested_weather).to be_an_instance_of Parsers
      end
    end
  end

  describe '#some_location' do
    context 'when run' do
      it 'adds items to array' do
        new_instance.add_city_weather
        expect(new_instance.weathers.count).to eql(4)
      end
    end
  end
end
