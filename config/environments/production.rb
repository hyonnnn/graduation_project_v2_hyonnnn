require "active_support/core_ext/integer/time"

Rails.application.configure do
  config.cache_classes = false
  config.eager_load = false
  config.consider_all_requests_local = true
  config.server_timing = true

  config.cache_store = :null_store

  config.active_storage.service = :local

  config.action_mailer.perform_caching = false

  # 🚨 開発環境で Gmail を使ったメール送信設定
  config.action_mailer.raise_delivery_errors = true
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings = {
    address:              "smtp.gmail.com",
    port:                 587,
    domain:               "gmail.com",
    user_name:            ENV["GMAIL_USER"],      # Gmail アドレス
    password:             ENV["GMAIL_PASSWORD"],  # Gmail アプリパスワード
    authentication:       "plain",
    enable_starttls_auto: true
  }
  config.action_mailer.default_url_options = {
    host: "localhost",
    port: 3000
  }
  # 🚨 ここまで

  config.active_support.deprecation = :log
  config.active_support.disallowed_deprecation = :raise
  config.active_support.disallowed_deprecation_warnings = []

  config.active_record.migration_error = :page_load
  config.active_record.verbose_query_logs = true

  config.assets.quiet = true
end
