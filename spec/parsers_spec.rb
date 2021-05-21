require_relative '../lib/parsers.rb'

describe Parsers do
  describe "#initialize" do
    context "when city is passed" do
      it "formats the correct url with the city" do
        new_inst = Parsers.new('Paris')
        expect(new_inst.url).to eql("https://www.weather-forecast.com/locations/Paris/forecasts/latest")
      end
    end
  end
end