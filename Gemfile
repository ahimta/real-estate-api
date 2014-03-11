source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 4.0.3'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', '~> 0.4.0', require: false
end

group :development, :test do
  gem 'sqlite3', '~> 1.3.9'
  gem 'rspec-rails', '~> 2.14.1'
  gem 'guard-rspec', '~> 0.4.0', require: false
  gem 'factory_girl_rails', '~> 4.4.1'
  gem 'railroady', '~> 1.1.1'
end

group :production do
  gem 'pg'
  gem 'rails_12factor'
end

gem 'rails-i18n', '~> 4.0.1'
gem 'rack-cors', '~> 0.2.9', require: 'rack/cors'
gem 'active_model_serializers', '~> 0.8.0'
