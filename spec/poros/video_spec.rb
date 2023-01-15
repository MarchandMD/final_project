require 'rails_helper'

describe 'Video' do
  it 'exists, with attributes' do
    attributes = {
      id: {
        videoId: 'foo id'
      },
      snippet: {
        title: 'foo title'
      }
    }

    video = Video.new(attributes)

    expect(video).to be_a Video
    expect(video.title).to eq('foo title')
    expect(video.youtube_video_id).to eq('foo id')
  end
end
