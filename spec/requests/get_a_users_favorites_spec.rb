require 'rails_helper'

describe 'API endpoint to get a users favorites' do
  describe 'get /api/v1/favorites?api_key:xxx' do

    it 'returns 404 if no user found' do
      get '/api/v1/favorites?api_key=1'
      expect(response.status).to be 404
    end


    it 'returns an empty array if no favorites', :vcr do
      user = User.create!(name: 'Athena', email: 'athena@bestgirlever.com')
      get "/api/v1/favorites?api_key:#{user.apikey}"

      parsed_response = JSON.parse(response.body, symbolize_names: true)

      expect(parsed_response).to be_a Hash
      expect(parsed_response).to have_key :data

      expect(parsed_response[:data]).to eq([])
    end

    it 'returns favorites as JSON data', :vcr do
      user = User.create!(name: 'Athena', email: 'athena@bestgirlever.com')
      fav1 = user.favorites.create!(recipe_title: 'foo recipe title', recipe_link: 'foo recipe_link', country: 'thailand')
      fav2 = user.favorites.create!(recipe_title: 'foo recipe title', recipe_link: 'foo recipe_link', country: 'thailand')
      fav3 = user.favorites.create!(recipe_title: 'foo recipe title', recipe_link: 'foo recipe_link', country: 'thailand')

      get "/api/v1/favorites?api_key:#{user.apikey}"

      parsed_response = JSON.parse(response.body, symbolize_names: true)

      expect(parsed_response).to be_a Hash
      expect(parsed_response).to have_key :data

      expect(parsed_response[:data]).to be_an Array
      expect((parsed_response[:data].count)).to  eq(user.favorites.count)
    end
  end
end