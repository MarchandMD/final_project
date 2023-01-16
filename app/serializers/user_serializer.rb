class UserSerializer
  include JSONAPI::Serializer

  attributes :name, :email, :apikey
end
