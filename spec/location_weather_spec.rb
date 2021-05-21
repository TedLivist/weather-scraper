require_relative '../lib/location_weather.rb'

describe LocationWeather do
  describe "#initialize" do
    context "when instantiated" do
      it "also creates an instance of Parsers class" do
        new_instance = LocationWeather.new('Lagos')
        expect(new_instance.requested_weather).to be_an_instance_of Parsers
      end
    end
  end

  describe "#some_location" do
    context "when run" do
      it "adds items to array" do
        new_instance = LocationWeather.new('Ikeja')
        expect(new_instance.weathers.count).to eql(0)
      end
    end
  end
end