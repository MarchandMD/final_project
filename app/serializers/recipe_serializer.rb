class RecipeSerializer
  include JSONAPI::Serializer

  set_id { nil }
  attributes :title, :country, :url, :image
end
