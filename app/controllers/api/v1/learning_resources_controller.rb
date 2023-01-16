class Api::V1::LearningResourcesController < ApplicationController
  def index
    country = request.params[:country]
    video = VideoFacade.new.video(country)
    images = ImageFacade.new.images(country)
    render json: LearningResourceSerializer.format_resources(country, video, images)
  end
end
