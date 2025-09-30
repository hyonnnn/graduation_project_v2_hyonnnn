class ApplicationController < ActionController::Base
  # Sorcery の require_login は削除
  # before_action :require_login

  # Devise のログイン必須に変更
  before_action :authenticate_user!

  # Sorcery の not_authenticated は不要なので削除
  # def not_authenticated
  #   redirect_to login_path, alert: 'Login required'
  # end
end
