# Ruby 3.2.3 を使用
FROM ruby:3.2.3

# 必要なパッケージをインストール
RUN apt-get update -qq && apt-get install -y build-essential libsqlite3-dev nodejs

# 作業ディレクトリを作成
WORKDIR /myapp

# Gemfile と Gemfile.lock をコピー
COPY Gemfile* ./

# Bundlerをインストールしてgemをインストール
RUN gem install bundler && bundle install

# アプリのコードをコピー
COPY . .

# ポート3000を開放
EXPOSE 3000

# コンテナ起動時に実行するコマンド
CMD ["rails", "server", "-b", "0.0.0.0"]
