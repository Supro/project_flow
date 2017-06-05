require 'rails_helper'
require 'capybara/rails'
require 'capybara/poltergeist'
require 'database_cleaner'

Capybara.register_driver :poltergeist do |app|
  Capybara::Poltergeist::Driver.new(app,
    js_errors: true,  # turn on javascript errors on page
    inspector: true
  )
end

Capybara.javascript_driver = :poltergeist
Capybara.current_driver    = :poltergeist
Capybara.default_max_wait_time = 5

RSpec.configure do |config|
  config.use_transactional_fixtures = false

  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.strategy = :transaction
  end

  config.before(:each, js: true) do
    DatabaseCleaner.strategy = :truncation
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
end

class ActiveRecord::Base
  mattr_accessor :shared_connection
  @@shared_connection = {}

  def self.connection
    @@shared_connection[self.connection_config[:database]] ||= retrieve_connection
  end
end
