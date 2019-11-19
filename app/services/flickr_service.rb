# frozen_string_literal: true

class FlickrService
  def initialize(lat, long, tags = 'downtown,sky')
    @lat = lat
    @long = long
    @tags = tags
  end

  def image_search
    parameter = {
      method: 'flickr.photos.search',
      sort: 'interestingness-desc',
      tags: tags,
      lat: lat,
      lon: long,
      per_page: 15,
      content_type: 1,
      safe_search: 1
    }

    get_json(parameter)
  end

  private

  attr_reader :lat, :long, :tags

  def conn
    @conn ||= Faraday.new(url: "https://www.flickr.com/services/rest/?") do |faraday|
      faraday.params['api_key'] = ENV['FLICKR_API_KEY']
      faraday.params['format'] = 'json'
      faraday.params['nojsoncallback'] = 1
      faraday.adapter Faraday.default_adapter
    end
  end

  def get_json(parameter, url = '')
    response = conn.get(url, parameter)
    JSON.parse(response.body, symbolize_names: true)
  end
end
