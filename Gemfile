source 'http://rubygems.org'

gem 'rails', '4.0.0'

gem 'sqlite3-ruby', :require => 'sqlite3'
gem 'paperclip'
gem 'will_paginate'
gem 'aws-s3', :require => 'aws/s3'
gem 'bcrypt-ruby', :require => 'bcrypt'
gem 'honeypot-captcha'
gem 'html-pipeline'
gem 'github-linguist'

gem 'jquery-rails'
gem 'therubyracer'

gem 'rspec-rails', :group => [:test,:development]

group :production do
  gem 'pg'
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails', github: 'rails/sass-rails'
  gem 'uglifier', '>= 1.0.3'
end

group :test do
  gem 'factory_girl_rails'
  gem 'capybara'
end
