require 'rails_helper'

describe 'CountryService' do
  describe '#any_country' do
    it 'returns a country', :vcr do
      country = CountryService.new.any_country

      expect(country).to be_a String
    end
  end
end
