require 'rails_helper'

describe 'videoervice' do
  describe '#video' do
    it 'returns video data', :vcr do
      # kewl code here
      country = 'Thailand'

      video = VideoService.new.video(country)

      expect(video).to be_a Hash
      expect(video).to have_key :items

      expect(video[:items]).to be_an Array
      expect(video[:items].count).to eq(1)

      video[:items].each do |vid|
        expect(vid).to have_key :id
        expect(vid[:id]).to be_a Hash
        expect(vid[:id]).to have_key :kind
        expect(vid[:id]).to have_key :videoId

        expect(vid).to have_key :snippet
        expect(vid[:snippet]).to have_key :title
      end
    end
  end
end
