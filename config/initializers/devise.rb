# frozen_string_literal: true

Devise.setup do |config|
  # ---------------------------------------------------
  # メール送信元設定（SendGrid 用）
  # ---------------------------------------------------
  config.mailer_sender = 'no-reply@yourdomain.com' # SendGrid で認証済みメールアドレス

  # Devise が使用する ORM
  require 'devise/orm/active_record'

  # ---------------------------------------------------
  # 認証キー設定
  # ---------------------------------------------------
  config.case_insensitive_keys = [:email]        # メールアドレスは大文字小文字を区別しない
  config.strip_whitespace_keys = [:email]       # 前後の空白を削除

  # セッションに保存しない認証方式
  config.skip_session_storage = [:http_auth]

  # ---------------------------------------------------
  # パスワード関連設定
  # ---------------------------------------------------
  config.stretches = Rails.env.test? ? 1 : 12   # bcrypt のハッシュ計算回数
  config.password_length = 6..128               # パスワード文字数
  config.reset_password_within = 6.hours       # パスワードリセット有効時間
  config.expire_all_remember_me_on_sign_out = true

  # ---------------------------------------------------
  # メール確認（Confirmable）
  # ---------------------------------------------------
  config.reconfirmable = true                   # メール変更時にも確認メール送信

  # ---------------------------------------------------
  # サインアウト設定
  # ---------------------------------------------------
  config.sign_out_via = :delete

  # ---------------------------------------------------
  # Email 正規表現
  # ---------------------------------------------------
  config.email_regexp = /\A[^@\s]+@[^@\s]+\z/

  # ---------------------------------------------------
  # Hotwire/Turbo 用レスポンス設定
  # ---------------------------------------------------
  config.responder.error_status = :unprocessable_entity
  config.responder.redirect_status = :see_other

  # ---------------------------------------------------
  # Devise Mailer をカスタムする場合（必要ならコメントを外す）
  # ---------------------------------------------------
  # config.mailer = 'Devise::Mailer'
  # config.parent_mailer = 'ActionMailer::Base'

  # ---------------------------------------------------
  # その他オプションはデフォルトのまま
  # ---------------------------------------------------
end
