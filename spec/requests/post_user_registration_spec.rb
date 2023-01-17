require 'rails_helper'

describe 'post user registration', type: :request do
  it 'posts a user', :vcr do
    params = {
      user: {
        name: 'Athena Dao',
        email: 'athena@bestgirlever.com'
      }
    }

    post '/api/v1/users/', params: params

    user = User.last

    expect(response).to be_successful

    parsed_response = JSON.parse(response.body, symbolize_names: true)

    expect(parsed_response).to be_a Hash
    expect(parsed_response).to have_key :data

    expect(parsed_response[:data]).to be_a Hash
    expect(parsed_response[:data]).to have_key :type
    expect(parsed_response[:data]).to have_key :id
    expect(parsed_response[:data]).to have_key :attributes

    expect(parsed_response[:data][:type]).to eq('user')
    expect(parsed_response[:data][:id]).to eq("#{user.id}")

    expect(parsed_response[:data][:attributes]).to be_a Hash
    expect(parsed_response[:data][:attributes]).to have_key :name
    expect(parsed_response[:data][:attributes][:name]).to eq(user.name)
    expect(parsed_response[:data][:attributes][:email]).to eq(user.email)
    expect(parsed_response[:data][:attributes][:apikey]).to eq(user.apikey)
  end
end
