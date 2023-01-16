class VideoSerializer
  include JSONAPI::Serializer

  set_id { nil }
  attributes :title, :youtube_video_id
end
