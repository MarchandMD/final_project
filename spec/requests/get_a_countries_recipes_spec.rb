require 'rails_helper'

RSpec.describe "get a countries recipes" do
  it 'returns json data of a specific country-themed recipes' do
    country = 'France'

    get "/api/v1/recipes?country=#{country}"

    expect(response).to be_successful

    parsed_response = JSON.parse(response.body, symbolize_names: true)

    expect(parsed_response).to be_a Hash
    expect(parsed_response).to have_key :data

    expect(parsed_response[:data]).to be_an Array

    parsed_response[:data].each do |recipe|
      expect(recipe).to be_a Hash
      expect(recipe).to have_key :attributes
      expect(recipe[:attributes]).to have_key :url
      expect(recipe[:attributes]).to have_key :country
      expect(recipe[:attributes]).to have_key :image
    end
  end
end
