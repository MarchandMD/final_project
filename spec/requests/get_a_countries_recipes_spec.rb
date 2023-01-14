require 'rails_helper'

RSpec.describe "get a countries recipes" do
  it 'returns json data of a specific country-themed recipes' do
    country = 'France'

    get "/api/v1/recipes?country=#{country}"
  end
end
