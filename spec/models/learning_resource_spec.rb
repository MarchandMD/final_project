require 'rails_helper'

RSpec.describe LearningResource, type: :model do
  it 'exists, with attibutes' do
    video = {
      youtube_id: '1',
      title: 'foo title'
    }
    images = [1, 2, 3]
    country = 'Thailand'
    resource = LearningResource.new(country: country, video: video.to_s, images: images)

    expect(resource).to be_a LearningResource
    expect(resource.images).to be_an Array
    expect(resource.video).to be_a String
    expect(resource.country).to eq(country)
  end
end
