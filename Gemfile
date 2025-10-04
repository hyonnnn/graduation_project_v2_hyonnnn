source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.2.3'

# Rails 本体
gem "rails", "~> 7.0.8", ">= 7.0.8.7"

# Webサーバ
gem 'puma'

# フロントエンド関連
gem 'sass-rails'
gem 'uglifier'
gem 'coffee-rails'

# Rails 7 用 JavaScript 管理
gem 'importmap-rails'

# 起動高速化
gem 'bootsnap', require: false

# 認証
gem 'devise'
gem 'devise-i18n'
gem 'rails-i18n', '~> 7.0.0'

# 並列処理
gem 'concurrent-ruby', '1.3.4'

# Memcached 用キャッシュ
gem 'dalli'

# 開発・テスト環境用
group :development, :test do
  # データベース（SQLite3）
  gem 'sqlite3', '~> 1.4'

  # デバッグ
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
end

# 開発環境専用
group :development do
  # コンソールやファイル監視
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen'

  # デバッグ・エラー表示
  gem 'better_errors'
  gem 'binding_of_caller'

  # pry 系ツール
  gem 'pry-rails'
  gem 'pry-byebug'
  gem 'pry-doc'

  # コード品質チェック
  gem 'rubocop'
  gem 'rails_best_practices'

  # メール確認
  gem 'letter_opener'
end

# Windows/JRuby 用
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

# 本番環境用 DB（PostgreSQL）
group :production do
  gem 'pg'
end
