require 'rails_helper'

describe 'Getting learning resources' do
  it 'returns json data of learning resources', :vcr do
    get '/api/v1/learning_resources?country=laos'

    expect(response).to be_successful

    parsed_response = JSON.parse(response.body, symbolize_names: true)

    expect(parsed_response).to be_a Hash
    expect(parsed_response).to have_key :data

    expect(parsed_response[:data]).to be_a Hash
    expect(parsed_response[:data]).to have_key :id
    expect(parsed_response[:data]).to have_key :type
    expect(parsed_response[:data]).to have_key :attributes

    expect(parsed_response[:data][:attributes]).to be_a Hash
    expect(parsed_response[:data][:attributes]).to have_key :country
    expect(parsed_response[:data][:attributes][:country]).to eq('laos')

    expect(parsed_response[:data][:attributes]).to have_key :video
    expect(parsed_response[:data][:attributes][:video]).to be_a Hash
    expect(parsed_response[:data][:attributes][:video]).to have_key :title
    expect(parsed_response[:data][:attributes][:video]).to have_key :youtube_video_id

    expect(parsed_response[:data][:attributes]).to have_key :images
    expect(parsed_response[:data][:attributes][:images]).to be_an Array
  end
end
