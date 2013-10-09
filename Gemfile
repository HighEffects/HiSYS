source 'https://rubygems.org'

gem 'rails', '3.2.8'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'pg'
gem 'thin'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'therubyracer', :platforms => :ruby
  gem "less-rails" #Sprockets (what Rails 3.1 uses for its asset pipeline) supports LESS
  gem 'uglifier', '>= 1.0.3'
  gem 'jquery-rails'
  gem 'jquery-ui-rails'
  gem 'twitter-bootstrap-rails'
  gem "font-awesome-rails"
end


gem 'devise'
gem 'simple_form'
gem 'ancestry'
gem 'redcarpet', '1.17.2'
gem 'pygmentize'
gem 'nokogiri'
# gem "nested_form"
gem "rmagick"
gem "carrierwave"
gem 'acts_as_list'
gem 'i18n'
gem "fog", "~> 1.3.1"




# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'

group :development do
  gem "letter_opener"
  gem 'better_errors'
  gem 'binding_of_caller'
end

group :test do
  gem "rspec"
  gem "rspec-rails"
  gem 'cucumber-rails'
  gem 'database_cleaner'
  gem 'factory_girl_rails'
end

group :production do
  gem 'newrelic_rpm'
  gem 'mixpanel'
end
