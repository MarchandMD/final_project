require 'rails_helper'

describe 'VideoService' do
  describe '#videos' do
    it 'returns video data', :vcr do
      # kewl code here
      country = 'Thailand'

      videos = VideoService.new.videos(country)

      expect(videos).to be_a Hash
      expect(videos).to have_key :items

      expect(videos[:items]).to be_an Array
      expect(videos[:items].count).to eq(5)

      videos[:items].each do |video|
        expect(video).to have_key :id
        expect(video[:id]).to be_a Hash
        expect(video[:id]).to have_key :kind
        expect(video[:id]).to have_key :videoId

        expect(video).to have_key :snippet
        expect(video[:snippet]).to have_key :title
      end
    end
  end
end
