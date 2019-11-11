# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

File.read('./.ruby-version')

gem 'bootsnap', '>= 1.1.0', require: false
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.11'
gem 'rails', '~> 5.2.3'
gem 'figaro'
gem 'fast_jsonapi'


group :development, :test do
  gem 'factory_bot_rails', '~> 4.0'
  gem 'faker', '~> 1.8', '>= 1.8.7'
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'rubocop', require: false
  gem 'rubocop-rspec', require: false
  gem 'rspec-rails', '~> 3.7', '>= 3.7.2'
  gem 'pry-rails', '~> 0.3.9'
  gem 'vcr'
  gem 'webmock'
end

group :development do
  gem 'annotate'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'codecov', require: false
  gem 'database_cleaner', '~> 1.7'
  gem 'rspec_junit_formatter'
  gem 'selenium-webdriver'
  gem 'shoulda-matchers', '~> 3.1'
  gem 'simplecov', '~> 0.16.1', require: false
  gem 'webdrivers', '~> 3.0'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
