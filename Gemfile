# frozen_string_literal: true

source 'https://rubygems.org'

git_source(:github) { |repo_name| "https://github.com/#{repo_name}" }

# gem "rails"
gem 'activerecord'
gem 'factory_bot'
gem 'pg'
gem 'rake'
gem 'sinatra'
gem 'sinatra-activerecord'
gem 'sinatra-contrib'

group :test, :development do
  gem 'pry'
end

group :test do
  gem 'capybara'
  gem 'database_cleaner'
  gem 'rspec', '~> 3.4'
  gem 'rubocop'
  gem 'shoulda'
  gem 'shoulda-matchers', '~> 3.1', require: false
  gem 'simplecov'
  gem 'valid_attribute'
end
