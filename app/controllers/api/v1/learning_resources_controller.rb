class Api::V1::LearningResourcesController < ApplicationController
  def index

    learning_resource = LearningResource.create!(video: 'foo video', country: 'Thailand', images: [1, 2, 3])
    render json: LearningResourceSerializer.new(learning_resource)
  end
end
