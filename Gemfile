source 'https://rubygems.org'

ruby "2.3.1"

gem 'rails', '5.0.0.beta3'

gem 'paperclip', '~> 4.3.0'
gem 'kaminari'
gem 'aws-sdk', '< 2.0'
gem 'bcrypt'
gem 'negative_captcha'
gem 'html-pipeline'
gem 'html-pipeline-youtube'

# html-pipeline deps
gem 'sanitize'
gem 'github-markdown'
gem 'gemoji'

gem 'jquery-rails'
gem 'therubyracer'

#gem 'rspec-rails', :group => [:test,:development], github: "rspec/rspec-rails"

%w[rspec-core rspec-expectations rspec-mocks rspec-rails rspec-support].each do |lib|
  gem lib, :git => "https://github.com/rspec/#{lib}.git", :branch => 'master'
end

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

#gem 'exception_notification', '~> 4.1.1'
gem 'unicorn'

source 'https://rails-assets.org' do
  gem 'rails-assets-three.js'
end

gem 'localeapp'
