source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.4.1'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.0'
# Use Bootstrap
gem 'bootstrap'
# Use jQuery
gem "jquery-rails"
# Use Puma as the app server
gem 'puma', '~> 3.11'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'mini_racer', platforms: :ruby

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false

# Use Carrierwave
gem 'carrierwave'
gem 'carrierwave-base64'
# Use ActiveStorage variant
gem 'mini_magick', '~> 4.8'
# Use fog
gem 'fog'

# twitter認証
gem 'omniauth'
gem 'omniauth-twitter'

# reCAPTHCA導入
gem 'recaptcha', require: 'recaptcha/rails'

# Google Analytics
gem 'google-analytics-rails'

# 日本語化
gem 'rails-i18n'
# Use FontAwesome
gem 'font-awesome-rails'
# Change Modal design
gem 'data-confirm-modal'
# 環境変数管理
gem 'dotenv-rails'
# OGP
gem 'meta-tags'

# dropzone
gem 'ezdz-rails'

# active_hash
gem 'active_hash'

# ransack
gem 'ransack'

# kaminari
gem 'kaminari'

# analytics
gem 'google-analytics-rails'

# twesume.herokuapp.comをtwesume.workに301リダイレクトするため
gem 'rack-rewrite'

# 短縮URL生成のため
gem 'bitly'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  # Use sqlite3 as the database for Active Record
  gem 'sqlite3'

  # Rspec関連gem
  gem 'rspec-rails', '~> 3.6.0'
  gem 'factory_bot_rails'
  gem 'rails-controller-testing'
  gem 'capybara'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :production do
  gem 'pg', '0.21.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
