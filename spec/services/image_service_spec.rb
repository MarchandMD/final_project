require 'rails_helper'

describe 'ImageService' do
  describe '#images' do
    it 'returns image data', :vcr do
      # code here
      country = 'Thailand'

      images = ImageService.new.images(country)

      expect(images).to be_a Hash
      expect(images).to have_key :results

      expect(images[:results]).to be_an Array
      expect(images[:results].count).to be >=0

      expect(images[:results][0]).to be_a Hash
      expect(images[:results][0]).to have_key :alt_description

      images[:results].each do |image_hash|
        expect(image_hash).to be_a Hash

        expect(image_hash).to have_key :urls
        expect(image_hash[:urls]).to be_a Hash
        expect(image_hash[:urls]).to have_key :raw
      end

    end
  end
end