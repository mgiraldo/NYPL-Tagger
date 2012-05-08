source 'http://rubygems.org'

gem 'rails', '3.1.1'

# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'

gem 'devise'

gem 'omniauth'

gem 'omniauth-openid'

gem 'acts-as-taggable-on', '~> 2.2.2'

gem 'thin'

group :development do
  gem 'sqlite3'
end
group :production do
  gem 'pg'
end

# sass-rails > 3.1.4 fails precompile on heroku cedar
gem 'sass-rails',   '3.1.4'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'coffee-rails', '~> 3.1.1'
  gem 'uglifier', '>= 1.0.3'
  gem 'bootstrap-sass'
end

gem 'jquery-rails'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'

group :test do
  # Pretty printed test output
  gem 'turn', :require => false
end
