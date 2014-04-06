source 'https://rubygems.org'
ruby '2.1.0'

gem 'rails', '4.0.2'
gem 'pg'

gem 'foreman'
gem 'unicorn'
gem 'rails_12factor', group: :production
gem 'sidekiq', require: "sidekiq/web"
gem 'autoscaler' # autoscales sidekiq workers
gem 'sinatra'
gem 'yajl-ruby', require: 'yajl/json_gem'
gem 'newrelic_rpm'

gem 'bcrypt-ruby'

gem 'sass-rails', '~> 4.0.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'jquery-ui-rails'
gem 'ranked-model'
gem 'turbolinks'
gem 'foundation-rails'
gem 'premailer-rails'
gem 'font-awesome-rails'

gem 'filepicker-rails'
gem 'will_paginate', '~> 3.0'

group :test do
  gem 'factory_girl_rails'
  gem 'capybara'
  gem 'capybara-email'
end

group :development do
  gem 'quiet_assets'
  gem 'rails_best_practices'
  gem 'mail_view'
end

group :test, :development do
  gem 'rspec-rails'
  gem 'pry'
end
