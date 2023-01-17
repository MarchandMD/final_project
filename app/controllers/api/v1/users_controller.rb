require 'securerandom'
class Api::V1::UsersController < ApplicationController
  def create
    new_user = User.new(user_params)
    new_user.apikey = SecureRandom.hex(16)

    if new_user.save
      render json: UserSerializer.new(new_user)
    else
      render json: { failure: 'email must be unique' }, status: 418
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
