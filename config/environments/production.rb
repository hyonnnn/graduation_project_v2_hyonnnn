# config/environments/production.rb
require "active_support/core_ext/integer/time"

Rails.application.configure do
  # ------------------------------
  # キャッシュとパフォーマンス
  # ------------------------------
  config.cache_classes = true
  config.eager_load = true
  config.consider_all_requests_local = false
  config.server_timing = false
  config.cache_store = :mem_cache_store, "localhost"

  # ------------------------------
  # 静的ファイル
  # ------------------------------
  config.public_file_server.enabled = ENV['RAILS_SERVE_STATIC_FILES'].present?
  config.public_file_server.headers = { 'Cache-Control' => 'public, max-age=31536000' }

  # ------------------------------
  # アセット
  # ------------------------------
  config.assets.compile = false
  config.assets.digest = true
  config.assets.quiet = true

  # ------------------------------
  # Active Storage
  # ------------------------------
  config.active_storage.service = :local

  # ------------------------------
  # メール送信設定（SendGrid 用）
  # ------------------------------
  config.action_mailer.raise_delivery_errors = true
  config.action_mailer.perform_caching = false
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.default_url_options = { host: ENV["DOMAIN"] || "your-app.onrender.com", protocol: "https" }
  config.action_mailer.smtp_settings = {
    address:              'smtp.sendgrid.net',
    port:                 587,
    domain:               ENV["DOMAIN"] || "your-app.onrender.com",
    user_name:            'apikey',                  # SendGrid 固定値
    password:             ENV['SENDGRID_API_KEY'],   # Render 環境変数
    authentication:       :plain,
    enable_starttls_auto: true
  }

  # ------------------------------
  # データベース
  # ------------------------------
  config.active_record.dump_schema_after_migration = false

  # ------------------------------
  # ログ
  # ------------------------------
  config.log_level = :info
  config.log_tags = [:request_id]
  config.logger = Logger.new(STDOUT)
  config.logger.formatter = config.log_formatter

  # ------------------------------
  # セキュリティ
  # ------------------------------
  config.force_ssl = true
  config.ssl_options = { hsts: { subdomains: true } }

  # ------------------------------
  # バックグラウンドジョブ
  # ------------------------------
  config.active_job.queue_adapter = :async

  # ------------------------------
  # デバッグ・警告
  # ------------------------------
  config.active_support.deprecation = :log
  config.active_support.disallowed_deprecation = :raise
  config.active_support.disallowed_deprecation_warnings = []

  # ------------------------------
  # 国際化設定
  # ------------------------------
  config.i18n.default_locale = :ja
  config.i18n.available_locales = [:ja, :en]
  config.i18n.fallbacks = [I18n.default_locale]
end
