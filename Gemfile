source 'https://rubygems.org'

ruby '2.1.5'

gem 'acts-as-taggable-on', '~> 3.4'
gem 'bootstrap-sass', '~> 3.3.3'
gem 'bourbon'
gem 'cancancan', '~>1.10'
gem 'coffee-rails'
gem 'devise'
gem 'dotenv-rails'
gem 'email_validator'
gem 'font-awesome-rails'
gem 'foreman'
gem 'http'
gem 'jquery-rails'
gem 'omniauth'
gem 'omniauth-twitter'
gem 'pg'
gem 'pry-rails'
gem 'puma'
gem 'rack-cors', :require => 'rack/cors'
gem 'rails', '~> 4.2.0'
gem 'recipient_interceptor'
gem 'sass-rails'
gem 'sidekiq'
gem 'slim-rails'
gem 'title'
gem 'twitter'
gem 'uglifier'
gem 'whenever', :require => false
gem 'bower'

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
  gem 'faker'
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
