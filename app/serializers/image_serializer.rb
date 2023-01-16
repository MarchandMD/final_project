class ImageSerializer
  include JSONAPI::Serializer

  set_id { nil }
  attributes :alt_tag, :url
end
