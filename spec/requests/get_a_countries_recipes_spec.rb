require 'rails_helper'

RSpec.describe "get a countries recipes" do
  context "happy path" do
    context "user provides the country param" do
      it 'returns json data of a specific country-themed recipes', :vcr do
        country = 'France'

        get "/api/v1/recipes?country=#{country}"

        expect(response).to be_successful

        parsed_response = JSON.parse(response.body, symbolize_names: true)

        expect(parsed_response).to be_a Hash
        expect(parsed_response).to have_key :data

        expect(parsed_response[:data]).to be_an Array

        parsed_response[:data].each do |recipe|
          expect(recipe).to be_a Hash
          expect(recipe).to have_key :id
          expect(recipe).to have_key :type
          expect(recipe[:type]).to eq('recipe')
          expect(recipe).to have_key :attributes
          expect(recipe[:attributes]).to have_key :url
          expect(recipe[:attributes]).to have_key :country
          expect(recipe[:attributes]).to have_key :image

          expect(recipe[:attributes]).to_not have_key :source
          expect(recipe[:attributes]).to_not have_key :yield
          expect(recipe[:attributes]).to_not have_key :shareAs
          expect(recipe[:attributes]).to_not have_key :healthLabels
          expect(recipe[:attributes]).to_not have_key :dietLabels
        end

        expect(parsed_response.keys.length).to eq(1)
      end
    end

    context "user does not provide the country param" do
      it 'returns json data of a randomly selected country' do
        VCR.use_cassette('problem cassette', record: :new_episodes) do
          get "/api/v1/recipes"

          parsed_response = JSON.parse(response.body, symbolize_names: true)

          expect(parsed_response).to be_a Hash

          expect(parsed_response).to have_key :data
          expect(parsed_response[:data]).to be_an Array

          if parsed_response[:data] != []
            expect(parsed_response[:data].count).to be >= 1

            parsed_response[:data].each do |recipe|
              expect(recipe).to have_key :id

              expect(recipe).to have_key :type
              expect(recipe[:type]).to eq('recipe')

              expect(recipe).to have_key :attributes
              expect(recipe[:attributes]).to be_a Hash
              expect(recipe[:attributes]).to have_key :title
              expect(recipe[:attributes]).to have_key :country
              expect(recipe[:attributes]).to have_key :url
              expect(recipe[:attributes]).to have_key :image
            end
          end
        end
      end
    end
  end

  context "sad path" do
    context "country is passed as an empty string" do
      it 'returns an empty array', :vcr do
        get "/api/v1/recipes?country=''"

        parsed_response = JSON.parse(response.body, symbolize_names: true)

        expect(parsed_response).to have_key :data
        expect(parsed_response[:data]).to eq([])
      end
    end
  end
end
