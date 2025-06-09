source "https://rubygems.org"

# Auth
gem 'devise'
gem 'devise-jwt'

# Core
gem "rails", "~> 7.2.0"
gem "pg", "~> 1.1"
gem "puma", ">= 5.0"

# Windows
gem "tzinfo-data", platforms: %i[ windows jruby ]

# Performance
gem "bootsnap", require: false

# Dev/Test only
group :development, :test do
  gem 'rspec-rails'
  gem "debug", platforms: %i[ mri windows ], require: "debug/prelude"
  gem "brakeman", require: false
  gem "rubocop-rails-omakase", require: false
  gem 'spring-commands-rspec'
  gem 'dotenv-rails'
end
