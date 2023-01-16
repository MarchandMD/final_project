class ImageFacade


  def images(country)
    images = service.images(country)[:results]

    images.map do |image_hash|
      Image.new(image_hash)
    end
  end

  def service
    ImageService.new
  end
end