class CountryService
  def any_country
    get_url("/v2/all?fields=name").sample[:name]
  end

  def get_url(url, params = nil)
    response = conn.get(url, params)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: "https://restcountries.com") do |faraday|
      # faraday.params['api_key'] = ENV.fetch('tmdb_api_key', nil)
      # faraday.params['language'] = 'en-US'
    end
  end
end
