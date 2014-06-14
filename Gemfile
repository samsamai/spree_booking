source 'https://rubygems.org'

# gem 'watu_table_builder', require: 'table_builder'
gem 'spree', github: 'spree/spree', branch: '2-2-stable'
# Provides basic authentication functionality for testing parts of your engine
gem 'spree_auth_devise', github: 'spree/spree_auth_devise', branch: '2-2-stable'
# gem 'gon'


group :development do
  gem 'debugger'
end

group :development, :test do
  gem 'rspec-rails', '2.11.0'
  gem 'guard-rspec', '1.2.1'
  gem 'guard-spork', '1.2.0'
  gem 'childprocess'
  gem 'spork', '0.9.2'
end

group :test do
end

gemspec
