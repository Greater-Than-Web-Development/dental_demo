source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
ruby '2.0.0'
gem 'rails', '4.1.5'
# Use sqlite3 as the database for Active Record

gem 'nokogiri'

#seeds file fake values
gem 'faker'

# store database contents in seeds file
gem 'seed_dump'

#accounts management
gem 'activeadmin', github: 'gregbell/active_admin'

# gem "meta_search" #conflicts with Devise

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.3'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer',  platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0',          group: :doc

# Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
gem 'spring',        group: :development

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]

#Active Record Query formatting
gem 'squeel'

#Prints out objects with indentation
gem 'awesome_print'

#helps manage dynos on heroku
gem 'hirefireapp'





gem 'bootstrap-sass'
gem 'devise'
gem 'devise_invitable'
gem 'figaro', '>= 1.0.0.rc1'
gem 'high_voltage'
gem 'pg'
gem 'simple_form'
gem 'unicorn'
gem 'unicorn-rails'

#Time difference
gem 'time_difference'

#Active Record Time Vaidatios
gem 'validates_timeliness', '~> 3.0'


gem 'rails_12factor', group: :production

# Hidden fields/Anti-spam form submissions
gem 'honeypot-captcha'

gem "font-awesome-rails"

# Deal with holidays
gem 'holidays'

# Background Slide for Welcome Page
gem 'backstretch-rails'

# Responders
gem 'responders'

# Caching
gem 'dalli', '~> 1.1'

# Monitoring
gem 'newrelic_rpm', '~> 3.4'





group :development do
  gem 'better_errors'
  gem 'binding_of_caller', :platforms=>[:mri_19]
  gem 'quiet_assets'
  gem 'rails_apps_pages'
  gem 'rails_apps_testing'
  gem "letter_opener" #email testing
  gem 'rails_layout'
end

group :development, :test do
  gem 'factory_girl_rails'
  gem 'faker'
  gem 'pry-rails'
  gem 'pry-rescue'
  gem 'rspec-rails'
end

group :test do
  gem 'capybara'
  gem 'database_cleaner'
  gem 'turn', '~> 0.8', :require => false
  gem 'launchy'
  gem 'selenium-webdriver'
end

