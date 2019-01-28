require 'factory_bot'
require 'pry'
require 'rspec'
require 'capybara/rspec'
require_relative 'support/database_cleaner'
require_relative '../app.rb'
require 'valid_attribute'
require 'shoulda/matchers'

set :environment, :test
set :database, :test

ActiveRecord::Base.logger.level = 1

Capybara.app = Treeandb

RSpec.configure do |config|
  config.include Capybara

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups
end

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :active_record
    with.library :active_model
  end
end

FactoryBot.definition_file_paths = %w[./spec/factories]
FactoryBot.find_definitions
