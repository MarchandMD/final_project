class RecipeFacade
  def recipes(country)
    recipes = service.recipes(country)[:hits]

    recipes.map { |recipe| Recipe.new(recipe[:recipe], country) }
  end

  def service
    RecipeService.new
  end
end
