require 'rails_helper'

RSpec.describe Favorite, type: :model do
  describe 'relationships' do
    it { should belong_to(:user) }
  end

  it 'exists, with attributes' do
    user = User.create!(name: 'foo name', email: 'foo email', apikey: 'api key')
    fav = user.favorites.create!(country: 'foo country', recipe_link: 'foo recipe link', recipe_title: 'foo recipe title')

    expect(fav).to be_a Favorite
    expect(fav.country).to eq('foo country')
    expect(fav.recipe_link).to eq('foo recipe link')
    expect(fav.recipe_title).to eq('foo recipe title')
  end
end
