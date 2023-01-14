require 'rails_helper'

RSpec.describe 'Recipe' do
  describe 'the object' do
    it 'exists, with attributes' do
      attributes = {
        label: 'foo name',
        url: 'foo url',
        cuisineType: ['foo country'],
        image: 'foo image'
      }

      country = 'Thailand'
      recipe = Recipe.new(attributes, country)

      expect(recipe).to be_a Recipe

      expect(recipe.title).to eq('foo name')
      expect(recipe.url).to eq('foo url')
      expect(recipe.country).to eq(country)
      expect(recipe.image).to eq('foo image')
    end
  end
end
