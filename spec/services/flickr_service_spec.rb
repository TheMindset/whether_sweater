# frozen_string_literal: true

require 'rails_helper'

RSpec.describe FlickrService do
  it "retreive images for a specific location" do
    pictures = described_class.new(48.856614, 2.3522219, 'downtown,sky')

    VCR.use_cassette('retreive_images_response') do
      first_picture = pictures.image_search

      expect(first_picture).to be_a(Hash)
      expect(first_picture[:photos][:photo][0][:id]).to eq("45076145644")
      expect(first_picture[:photos][:photo][0][:title]).to eq("Paris sera toujours Paris")
    end
  end
end
