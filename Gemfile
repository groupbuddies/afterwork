source 'https://rubygems.org'

ruby '2.1.5'

gem 'bourbon'
gem 'coffee-rails'
gem 'dotenv-rails'
gem 'email_validator'
gem 'foreman'
gem 'jquery-rails'
gem 'pg'
gem 'pry-rails'
gem 'puma'
gem 'rack-timeout'
gem 'rails', '~> 4.2.0'
gem 'recipient_interceptor'
gem 'sass-rails'
gem 'slim-rails'
gem 'title'
gem 'uglifier'

group :development do
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'letter_opener'
end

group :development, :test do
  gem 'awesome_print'
  gem 'factory_girl_rails'
  gem 'rspec-rails', '~> 3.0'
end

group :test do
  gem 'capybara-webkit', '>= 1.0.0'
  gem 'database_cleaner'
  gem 'launchy'
  gem 'simplecov', require: false
  gem 'timecop'
  gem 'webmock'
  gem 'rubocop', require: false
end

group :production, :staging do
  gem 'rails_12factor'
end

group :deploy do
  gem 'capistrano', '~> 3.2.1', require: false
  gem 'capistrano-rails', require: false
  gem 'capistrano-rvm', require: false
  gem 'capistrano-bundler', require: false
  gem 'capistrano3-env', require: false
  gem 'capistrano-foreman', github: 'groupbuddies/capistrano-foreman', branch: :master
end
