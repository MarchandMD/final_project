require 'rails_helper'

RSpec.describe 'RecipeFacade' do
  describe '#recipes' do
    it 'returns an array of Recipe objects', :vcr do
      country = 'Thailand'

      recipes = RecipeFacade.new.recipes(country)

      expect(recipes).to be_an Array
      expect(recipes.count).to_not eq(0)
      recipes.each do |recipe|
        expect(recipe).to be_a Recipe
      end
    end
  end
end
