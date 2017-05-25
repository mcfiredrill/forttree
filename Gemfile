source 'https://rubygems.org'

ruby "2.3.3"

gem 'rails', '5.0.3'
gem 'dotenv-rails', :groups => [:development, :test]

gem 'paperclip', '~> 5.1.0'
gem 'kaminari'
gem 'aws-sdk'
gem 'bcrypt'
gem 'negative_captcha'
gem 'html-pipeline'
gem 'html-pipeline-youtube'

# html-pipeline deps
gem 'sanitize'
gem 'github-markdown'
gem 'gemoji'

gem 'jquery-rails', '4.2.0'
gem 'therubyracer'

gem 'rspec-rails', :group => [:test,:development]

group :production do
  gem 'pg'
  gem 'rails_12factor'
end

gem 'sass-rails', '~> 5.0.0'
gem 'uglifier', '>= 1.0.3'

group :test do
  gem 'factory_girl_rails'
  gem 'capybara'
end

group :development, :test do
  gem 'byebug'
  gem 'sqlite3', :require => 'sqlite3'
end

gem 'exception_notification'
gem 'unicorn'
gem 'pry-byebug'

source 'https://rails-assets.org' do
  gem 'rails-assets-three.js'
end

gem 'localeapp'
gem 'http_accept_language'
