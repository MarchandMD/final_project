require 'rails_helper'

RSpec.describe 'RecipeService' do
  describe '#recipes' do
    it 'grabs recipes for a country', :vcr do
      country = 'French'

      recipes = RecipeService.new.recipes(country)

      expect(recipes).to be_a Hash
      expect(recipes).to have_key :hits

      expect(recipes[:hits]).to be_an Array

      expect(recipes[:hits].count).to be > 0
      expect(recipes[:hits][0]).to be_a Hash

      expect(recipes[:hits][0]).to have_key :recipe
      expect(recipes[:hits][0][:recipe]).to be_a Hash

      expect(recipes[:hits][0][:recipe]).to have_key :label
      expect(recipes[:hits][0][:recipe]).to have_key :url
      expect(recipes[:hits][0][:recipe]).to have_key :image
    end
  end
end
