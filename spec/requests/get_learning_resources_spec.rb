require 'rails_helper'

describe 'Getting learning resources' do
  it 'returns json data of learning resources', :vcr do
    get '/api/v1/learning_resources?country=laos'
  end
end
