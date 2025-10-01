# Ruby 3.2.3 を使用
FROM ruby:3.2.3

# 必要なパッケージをインストール
RUN apt-get update -qq && apt-get install -y build-essential libsqlite3-dev nodejs yarn

# 作業ディレクトリ
WORKDIR /myapp

# Gemfile をコピーしてインストール
COPY Gemfile* ./
RUN gem install bundler && bundle install --without development test

# アプリケーションコードをコピー
COPY . .

# 本番用アセットプリコンパイル
RUN RAILS_ENV=production bundle exec rails assets:precompile

# ポートを開放
EXPOSE 3000

# サーバ起動
CMD ["rails", "server", "-b", "0.0.0.0", "-p", "3000"]
