class ImageService
  def images(country)
    get_url("/search/photos", { query: country })
  end

  def get_url(url, params = nil)
    response = conn.get(url, params)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: "https://api.unsplash.com") do |faraday|
      faraday.params['client_id'] = ENV.fetch('access_key', nil)
      # faraday.params['secret_key'] = ENV.fetch('secret_key', nil)
      faraday.params['language'] = 'en-US'
    end
  end
end
