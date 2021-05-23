require_relative '../lib/location_weather'

describe LocationWeather do
  new_instance = LocationWeather.new('Lagos')
  some_instance = LocationWeather.new('Santorini')
  describe '#add_city_weather' do
    context 'when not run' do
      it 'weathers array is empty' do
        expect(new_instance.weathers.count).to eql(0)
      end
    end

    context 'when run' do
      it 'adds items to array' do
        new_instance.add_city_weather
        expect(new_instance.weathers.count).to eql(4)
      end
    end
  end

  describe '#initialize' do
    context 'when instantiated' do
      it 'instance class inherits from Parsers class' do
        expect(new_instance.class).to be < Parsers
      end
    end

    context 'when information about city cannot be retrieved' do
      it 'weathers array is empty' do
        expect(some_instance.weathers.count).to eql(0)
      end
    end
  end
end
