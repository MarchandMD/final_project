class VideoFacade
  def video(country)
    video_hash = service.video(country)[:items][0]

    Video.new(video_hash)
  end

  def service
    VideoService.new
  end

end