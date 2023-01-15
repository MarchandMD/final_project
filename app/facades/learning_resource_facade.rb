class LearningResourceFacade
  def video(country)
    video_hash = video_service.video(country)[:items][0]

    video_obj = Video.new(video_hash)
    
    LearningResource.create!(country: country, video: video_obj.to_json)
  end

  def image_service
    # ImageService.new
  end

  def video_service
    VideoService.new
  end
end
