source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.0'

# Use sqlite3 as the database for Active Record
# gem 'sqlite3'

# ======== Assets ========

# CSS framework made with SASS
gem 'bootstrap-sass'
# Replacement for bootstrap glyphs
gem 'font-awesome-sass-rails'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Used for sortable lists
gem 'jquery-ui-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
# gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

# Pagination
gem 'kaminari'

# Authentication
# Only a very limited devise functionality is being used ( No password resets, tracking etc )
gem 'devise'

# Priority
gem 'acts_as_list'

# Forms
gem 'simple_form', '~> 3.0.0.beta1'

# In-place editing
gem 'bootstrap-editable-rails'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

group :development do
  gem 'zeus'
  gem 'meta_request'
  gem 'sqlite3'
end

group :test do
  gem 'shoulda-matchers'
  gem 'database_cleaner', '1.0.1'
  gem 'guard-rspec'
  gem 'capybara'
  gem 'selenium-webdriver'
  gem 'rb-inotify'
end

group :development, :test do
  gem 'pry-rails'
  gem 'factory_girl_rails' # factory generators
  gem 'rspec-rails'
end

group :production do
  gem 'pg'
  gem 'rails_12factor'
end

# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano', group: :development
