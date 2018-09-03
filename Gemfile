source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


gem 'rails', '~> 5.1.3'
gem 'sqlite3'
gem 'puma', '~> 3.7'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'therubyracer', platforms: :ruby
gem 'bcrypt', github: 'codahale/bcrypt-ruby', :require => 'bcrypt'
gem 'rack-cors'

gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'web-console', '>= 3.3.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

gem 'administrate', github: 'thoughtbot/administrate'
gem 'jquery-rails', '~> 4.3', '>= 4.3.1'
gem 'bootstrap-sass', '~> 3.3', '>= 3.3.6'
gem 'bootswatch-rails', '~> 3.3', '>= 3.3.5'
gem 'font-awesome-rails', '~> 4.7', '>= 4.7.0.2'
gem 'simple_form'
gem 'activerecord-import'
gem 'smarter_csv'
gem 'parallel', '~> 1.12'
gem 'devise'
gem 'ransack'
gem 'cancan'
gem 'geocoder'
gem 'chartkick'
gem 'groupdate'
gem 'highcharts-rails'
gem 'lodash-rails'
gem 'momentjs-rails'
gem 'moment_timezone-rails'
#gem 'will_paginate', '~> 3.1', '>= 3.1.6'
