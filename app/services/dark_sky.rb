class DarkSky

  def retreive_forecast(formatted_lat_long)
    get_json("/forecast/#{ENV['DARKSKY_API_KEY']}/#{formatted_lat_long}?lang=fr&units=si")
  end

  private

  def conn
    @conn ||= Faraday.new(url: "https://api.darksky.net") do |faraday|
      faraday.adapter Faraday.default_adapter
    end
  end

  def get_json(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

end