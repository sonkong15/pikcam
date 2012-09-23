source 'https://rubygems.org'



gem 'rails', '3.2.8'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'pg'


# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer'
  
end

gem 'jquery-rails'

# To use ActiveModel has_secure_password


# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the web server
 #gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'
  group :production do
  gem 'thin'
  gem 'bcrypt-ruby', '~> 3.0.0'
  gem "cancan"
  gem 'bootstrap-sass'
  gem 'simple_form'
  gem 'authlogic'
  gem 'client_side_validations'
  gem 'client_side_validations-simple_form'
  gem "paperclip"
  gem 'kaminari'
  gem 'make_flaggable', :git => 'git://github.com/cavneb/make_flaggable.git'
  gem "aws-sdk", "~> 1.6.5"
  gem 'uglifier', '>= 1.0.3'
  gem "friendly_id", "~> 4.0.1"
  end


gem "rspec-rails" , :group => [:test, :development]
group :test do
	gem "factory_girl_rails"
	gem "capybara"
	gem "guard-rspec"
  gem 'rack-mini-profiler'
	end
  