source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.2'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails', branch: 'main'
gem 'rails', '~> 6.1.3', '>= 6.1.3.2'
# Use postgresql as the database for Active Record
gem 'pg', '~> 1.1'
# Use Puma as the app server
gem 'puma', '~> 5.0'
# Use SCSS for stylesheets
gem 'sass-rails', '>= 6'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker', '~> 5.0'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.7'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'
# Use Devise for authentication
gem "devise", "~> 4.8"
# Use google authentication
gem "omniauth-rails_csrf_protection", "~> 1.0"
gem "omniauth-google-oauth2", "~> 1.0"
# Use Active Storage variant
# gem 'image_processing', '~> 1.2'
# Use ActiveAdmin for admin CRM
gem "activeadmin", "~> 2.9"
gem "active_material", github: "vigetlabs/active_material"
# use i18n for internationalization and localization 
gem 'rails-i18n', '~> 6.0.0'

gem 'date_validator', '~> 0.11.0'
# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.4', require: false
# Use Kaminari for pagination
gem "kaminari", "~> 1.2"
# Use Whenever for managing crontab jobs
gem 'whenever', "~> 1.0", require: false
# Use Faraday as http client
gem "faraday", "~> 1.4"

gem 'active_storage_validations', '~> 0.9.5'
gem 'mini_magick', '~> 4.11'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]

  # Use Rubocop as code linter
  gem "rubocop", "~> 1.17"
  gem "rubocop-rails", "~> 2.10"
  gem "rubocop-rspec", "~> 2.4"
  gem 'bullet', '~> 6.1', '>= 6.1.4'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 4.1.0'
  # Display performance information such as SQL time and flame graphs for each request in your browser.
  # Can be configured to work on production as well see: https://github.com/MiniProfiler/rack-mini-profiler/blob/master/README.md
  gem 'rack-mini-profiler', '~> 2.0'
  gem 'listen', '~> 3.3'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  # Preview email in the default browser instead of sending it
  gem "letter_opener", "~> 1.7"
  gem "lefthook", "~> 0.7.6"
  # load env vars from .env into ENV
  gem "dotenv-rails", "~> 2.7"

  gem "pry-byebug", "~> 3.9"
  gem "pry-rails", "~> 0.3.9"

  # Use capistrano for deploy
  gem "capistrano", "~> 3.16"
  gem "capistrano-bundler", "~> 2.0"
  gem "capistrano-rails", "~> 1.6"
  gem "capistrano3-puma", "~> 5.0"
  gem 'capistrano-rbenv', '~> 2.2'
  gem "ed25519", "~> 1.2"
  gem "bcrypt_pbkdf", "~> 1.1"

end

group :test do
  gem "factory_bot_rails", "~> 6.2"
  gem "faker", "~> 2.18"
  gem "capybara", "~> 3.35"
  gem 'shoulda-matchers', '~> 4.5', '>= 4.5.1'
  gem 'rspec-rails', '~> 5.0', '>= 5.0.1'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

gem "aws-sdk-s3", require: false
gem 'simplecov', require: false
gem 'receipts', '~> 1.1'
