class VideoService
  def video(country)
    get_url("/youtube/v3/search", { part: 'snippet', channelId: 'UCluQ5yInbeAkkeCndNnUhpw', q: country, maxResults: 1 })
  end

  def get_url(url, params = nil)
    response = conn.get(url, params)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: "https://www.googleapis.com") do |faraday|
      faraday.params['key'] = ENV.fetch('yt_key', nil)
      # faraday.params['language'] = 'en-US'
    end
  end
end
