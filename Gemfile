source "https://rubygems.org"

# Declare your gem's dependencies in krudmin.gemspec.
# Bundler will treat runtime dependencies like base dependencies, and
# development dependencies will be added by default to the :development group.
gemspec

# Declare any dependencies that are still in development here instead of in
# your gemspec. These might include edge Rails or gems from your path or
# Git. Remember to move these dependencies to your gemspec before releasing
# your gem to rubygems.org.

# To use a debugger
# gem 'byebug', group: [:development, :test]

gem 'bootsnap', '>= 1.1.0', require: false
gem "pg"
gem "redcarpet"

group :development do
  gem "better_errors"
  gem "binding_of_caller"
end

group :development, :test do
  gem "awesome_print"
  gem "factory_bot_rails"
  gem "ffaker"
  gem "hamlit-rails"
  gem "pry-byebug"
end

group :test do
  gem "capybara-screenshot"
  gem "database_cleaner"
  gem "guard-rspec"
  gem "poltergeist"
  gem "pundit"
  gem "rails-controller-testing"
  gem "rspec-rails"
  gem "simplecov"
  gem "timecop"
end

group :staging, :production do
  gem "uglifier"
end
