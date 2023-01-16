class LearningResource
  attr_reader :country,
              :video,
              :images

  def initialize(data, country = nil)
    @country = country
    @video = data[:video]
    @images = data[:images]
  end

end
