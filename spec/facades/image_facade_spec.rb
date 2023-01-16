require 'rails_helper'

describe 'ImageFacade' do
  describe '#images' do
    it 'returns an Array of Image objects', :vcr do
      country = 'Thailand'

      images = ImageFacade.new.images(country)

      expect(images).to be_an Array
      images.each do |image|
        expect(image).to be_an Image
        expect(image.alt_tag).to be_a String
        expect(image.url).to be_a String
      end
    end
  end
end