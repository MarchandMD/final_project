require 'rails_helper'

describe 'LearningResourceFacade' do
  describe '#video' do
    it 'returns a LearningResource Object with a String video attribute', :vcr do
      country = 'Thailand'

      video = LearningResourceFacade.new.video(country)

      expect(video).to be_a LearningResource
      expect(video.video).to be_a String
    end
  end
end
