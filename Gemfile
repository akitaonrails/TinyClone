source 'http://rubygems.org'

gem 'rails', '3.2.13'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem "haml-rails"
gem "rest-client", :require => "rest_client"
gem "xml-simple", :require => "xmlsimple"

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

group :development do
  gem "watchr"
end

group :development, :test do
  gem 'sqlite3'
  gem "rspec-rails"
end

group :production do
  gem "mysql2"
end
