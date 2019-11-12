# frozen_string_literal: true

require 'rails_helper'

RSpec.describe FlickrService do
  before do
    stub_json("https://www.flickr.com/services/rest/?api_key=7cd600c8e9a0cefe406db67100e74cb9&content_type=1&format=json&lat=48.856614&long=2.3522219&method=flickr.photos.search&nojsoncallback=1&per_page=15&safe_search=1&sort=interestingness-desc&tags=downtown,sky",
              "./fixtures/paris_pictures.json")
  end

  let!(:pictures) { described_class.new(48.856614, 2.3522219, 'downtown,sky') }

  it "exists" do
    expect(pictures).to be_a(described_class)
  end

  it "retreive images for a specific location" do
    first_picture = pictures.image_search

    expect(first_picture).to be_a(Hash)
    expect(first_picture[:photos][:photo][0][:id]).to eq("45076145644")
    expect(first_picture[:photos][:photo][0][:title]).to eq("Paris sera toujours Paris")
  end
end
