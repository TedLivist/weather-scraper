require_relative '../lib/parsers'

describe Parsers do
  describe '#initialize' do
    context 'when city is passed' do
      new_inst = Parsers.new('Paris')
      it 'formats the correct url with the city' do
        expect(new_inst.url).to eql('https://www.weather-forecast.com/locations/Paris/forecasts/latest')
      end

      it 'HTTParty body is a String' do
        expect(new_inst.unparsed_page.body).to be_an_instance_of String
      end
    end
  end
end
