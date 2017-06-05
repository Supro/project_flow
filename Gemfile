source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.0.1'
gem 'pg'
gem 'puma', '~> 3.0'

gem 'sass-rails', '~> 5.0'
gem 'bootstrap-sass'

gem 'uglifier', '>= 1.3.0'

gem 'slim'
gem 'react-rails'

group :development, :test do
  gem 'rspec-rails'
  gem 'capybara'
  gem 'poltergeist'
end

group :test do
  gem 'database_cleaner'
  gem 'shoulda-matchers'
end

gem 'factory_girl_rails'
gem 'faker'

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.0.5'
end

gem 'dry-initializer'
gem 'dry-validation'
gem 'dry-struct'

gem 'annotate'

gem 'rubocop', require: false

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

ruby '2.4.0'