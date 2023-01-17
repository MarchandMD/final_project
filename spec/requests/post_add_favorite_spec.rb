require 'rails_helper'

describe 'API post to add favorite', type: :request do
  describe 'post /api/v1/favorites' do
    it 'returns 201 for successful add', :vcr do
      user = User.create!(name: 'Athena Dao', email: 'athena@bestgirlever.com')

      params = {
        favorite: {
          api_key: user.apikey,
          country: 'thailand',
          recipe_link: 'foo recipe_link',
          recipe_title: 'foo recipe_title'
        }
      }

      post "/api/v1/favorites", params: params

      expect(response).to be_successful
      expect(response.status).to be 201
      expect(response.body).to eq('Favorite added successfully')
    end
    it 'returns 404 if user not found', :vcr do
      params = {
        favorite: {
          api_key: "1",
          country: 'thailand',
          recipe_link: 'foo recipe_link',
          recipe_title: 'foo recipe_title'
        }
      }

      post "/api/v1/favorites", params: params

      expect(response.status).to be 404
    end
  end
end
