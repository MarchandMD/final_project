class Api::V1::RecipesController < ApplicationController
  def index
    if request.params.has_key? :country
      render json: RecipeSerializer.new(RecipeFacade.new.recipes(request.params[:country]))
    else
      render json: RecipeSerializer.new(RecipeFacade.new.recipes(CountryService.new.any_country))
    end
  end
end
