source 'https://rubygems.org'
ruby '2.0.0'

gem 'bootstrap-sass'
gem 'bourbon'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'rails', '4.0.0'
gem 'sass-rails', '~> 4.0.0'
gem 'simple_form'
gem 'uglifier', '>= 1.3.0'

gem 'rails_12factor', group: :production

group :development do
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'sqlite3'
  gem 'mail_view'
end

group :development, :test do
  gem 'factory_girl_rails'
  gem 'rspec-rails'
end

group :production, :staging do
  gem 'newrelic_rpm'
  gem 'pg'
  gem 'rails_12factor'
end