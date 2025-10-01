source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.2.3'

gem "rails", "~> 7.0.8", ">= 7.0.8.7"
gem 'puma'
gem 'sass-rails'
gem 'uglifier'
gem 'coffee-rails'
gem 'bootsnap', require: false
gem 'devise'
gem 'concurrent-ruby', '1.3.4'

# 開発・テスト環境
group :development, :test do
  gem 'sqlite3', '~> 1.4'
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
end

# 開発専用
group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'pry-rails'
  gem 'pry-byebug'
  gem 'pry-doc'
  gem 'rubocop'
  gem 'rails_best_practices'
  gem 'letter_opener'
end

# Windows/JRuby 用
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

# 本番環境用 DB
gem 'pg', group: :production
