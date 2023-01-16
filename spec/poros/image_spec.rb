require 'rails_helper'

describe 'Image' do
  it 'exists, with attributes' do
    data = {
      alt_description: 'foo description becomes alt_tag',
      urls: {
        raw: 'raw foo url'
      }
    }

    image = Image.new(data)

    expect(image).to be_an Image
    expect(image.alt_tag).to eq('foo description becomes alt_tag')
    expect(image.url).to eq('raw foo url')
  end
end