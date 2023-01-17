class Api::V1::FavoritesController < ApplicationController
  def index
    if User.where(apikey: params[:api_key]).exists?
      favorites = User.where(apikey: params[:api_key]).first.favorites
      render json: FavoriteSerializer.format_favorites(favorites)
    else
      render json: 'better luck next time', status: 404
    end
  end

  def create
    if User.where(apikey: request.params[:api_key]).exists?
      user = User.where(apikey: request.params[:api_key]).first
      user.favorites.create!(fav_params)
      render json: 'Favorite added successfully', status: 201
    else
      render json: 'User not found', status: 404
    end
  end

  private

  def fav_params
    params.require(:favorite).permit(:country, :recipe_link, :recipe_title)
  end
end
