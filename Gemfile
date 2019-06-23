# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.4.6'

# Webops
gem 'newrelic_rpm'

gem 'bootsnap', '>= 1.1.0', require: false
gem 'date_validator'
gem 'jbuilder', '~> 2.5'
gem 'kaminari'
gem 'pg'
gem 'puma', '~> 3.11'
gem 'rails', '~> 5.2.3'
gem 'sass-rails', '~> 5.0'
gem 'turbolinks', '~> 5'
gem 'uglifier', '>= 1.3.0'
# for mailing
gem 'dotenv-rails'

# relevant for login
gem 'devise'

# map
gem 'leaflet-rails'

# drag and drop for hints overview
gem 'acts_as_list'
gem 'jquery-rails'
gem 'jquery-ui-rails', '~> 5.0', '>= 5.0.5'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'capybara', '~> 2.15'
  gem 'chromedriver-helper'
  gem 'selenium-webdriver'
end

group :development do
  gem 'dokku-cli'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'rb-readline'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

group :production do
  gem 'rails_12factor'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
