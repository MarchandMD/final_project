class Api::V1::FavoritesController < ApplicationController
  def create
    if User.where(apikey: request.params[:api_key]).exists?
      user = User.where(apikey: request.params[:api_key]).first
      user.favorites.create!(fav_params)
      render json: 'good jorb Homestar', status: 201
    else
      render json: 'User not found', status: 404
    end
  end

  private

  def fav_params
    params.require(:favorite).permit(:country, :recipe_link, :recipe_title)
  end
end
