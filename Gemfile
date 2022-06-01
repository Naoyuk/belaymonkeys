source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.2"

gem "bootsnap", require: false
gem "cssbundling-rails"
gem "devise"
gem "jbuilder"
gem "jsbundling-rails"
gem "pg", "~> 1.1"
gem "propshaft"
gem "puma", "~> 5.0"
gem "redis", "~> 4.0"
gem "rails", "~> 7.0.3"
gem "simple_form"
gem "simple_form-tailwind"
gem "stimulus-rails"
gem "turbo-rails"
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]

group :development, :test do
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
  gem "dotenv-rails"
  gem "rspec-rails"
end

group :development do
  gem "web-console"
end

group :test do
  gem "capybara"
  gem "capybara-screenshot"
  gem "factory_bot_rails"
  gem "selenium-webdriver"
end
