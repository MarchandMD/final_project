require 'rails_helper'

describe 'VideoFacade' do
  describe '#video' do
    it 'returns a Video object', :vcr do
      # kewl code here
      country = 'Thailand'

      VideoFacade.new.video(country)
    end
  end
end