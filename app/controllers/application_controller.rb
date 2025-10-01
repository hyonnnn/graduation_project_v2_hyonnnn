class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  # ログイン後の遷移先をタスク一覧に変更
  def after_sign_in_path_for(resource)
    tasks_path
  end
end
