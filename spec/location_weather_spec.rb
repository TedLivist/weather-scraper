require_relative '../lib/location_weather'

describe LocationWeather do
  new_instance = LocationWeather.new('Lagos')
  describe '#initialize' do
    context 'when instantiated' do
      it 'instance class inherits from Parsers class' do
        expect(new_instance.class).to be < Parsers
      end
    end
  end

  describe '#add_city_weather' do
    context 'when run' do
      it 'adds items to array' do
        new_instance.add_city_weather
        expect(new_instance.weathers.count).to eql(4)
      end
    end
  end
end
