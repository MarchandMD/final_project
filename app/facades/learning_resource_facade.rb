class LearningResourceFacade
  def video(country)
    video_hash = video_service.video(country)[:items][0]

    LearningResource.create!(country: country, video: video_hash)
  end

  def image_service
    # ImageService.new
  end

  def video_service
    VideoService.new
  end
end
