# frozen_string_literal: true

require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../config/environment', __dir__)

abort("The Rails environment is running in production mode!") if Rails.env.production?

Dir["./spec/support/**/*.rb"].sort.each { |f| require f }
require 'rspec/rails'
require 'faker'
require 'simplecov'
require 'webmock/rspec'

SimpleCov.start do
  add_filter "/spec/"
end

require 'codecov'

SimpleCov.formatters = SimpleCov::Formatter::MultiFormatter.new([
                                                                  SimpleCov::Formatter::HTMLFormatter,
                                                                  SimpleCov::Formatter::Codecov,
                                                                ])

begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  puts e.to_s.strip
  exit 1
end

RSpec.configure do |config|
  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.include FactoryBot::Syntax::Methods
  config.use_transactional_fixtures = true
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!
end

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end

# def stub_json(url, filename)
#   json_response = File.open(filename)
#   stub_request(:get, url).
#     to_return(status: 200, body: json_response)
# end

VCR.configure do |config|
  config.cassette_library_dir = "spec/vcr_cassettes"
  config.hook_into :webmock
  config.configure_rspec_metadata!
  config.filter_sensitive_data('<GOOGLE_MAPS_API_KEY>') { ENV['GOOGLE_MAPS_API_KEY'] }
  config.filter_sensitive_data('<DARKSKY_API_KEY>') { ENV['DARKSKY_API_KEY'] }
  config.filter_sensitive_data('<FLICKR_API_KEY>') { ENV['FLICKR_API_KEY'] }
end
