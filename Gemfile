source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.2.2"

gem "rails",           "~> 7.1.2"
gem "sassc-rails",     "2.1.2"
gem "sprockets-rails", "3.4.2"
gem "importmap-rails", "1.1.5"
gem "turbo-rails",     "1.4.0"
gem "stimulus-rails",  "1.2.1"
gem "jbuilder",        "2.11.5"
gem "puma",            "6.0.0"
gem "sqlite3",         "1.6.1"
gem 'bcrypt', '~> 3.1', '>= 3.1.12'
gem 'bootsnap', require: false

group :development, :test do
  gem "debug",   "1.7.1", platforms: %i[ mri mingw x64_mingw ]
end

group :development do
  gem "web-console",         "4.2.0"
  gem "solargraph",          "0.50.0"
  gem "irb",                 "1.10.0"
  gem "repl_type_completor", "0.1.2"
end

group :test do
  gem "capybara",                 "3.38.0"
  gem "selenium-webdriver",       "4.8.3"
  gem 'webdrivers'
  gem "rspec-rails",              "~> 6.1"
  gem "guard",                    "2.18.0"
  gem 'guard-rspec', require: false
  gem "factory_bot_rails"
end
