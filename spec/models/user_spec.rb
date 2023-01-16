require 'rails_helper'

describe User, type: :model do
  it 'exists, with attributes' do
    attributes = {
      name: 'Name',
      email: 'fooemail@email.com',
      apikey: SecureRandom.base64(16)
    }

    user = User.new(attributes)

    expect(user).to be_a User
    expect(user.name).to eq('Name')
    expect(user.email).to eq('fooemail@email.com')
    expect(user.apikey).to eq(attributes[:apikey])
  end
end
