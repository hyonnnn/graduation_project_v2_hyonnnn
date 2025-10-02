class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  # ログイン後の遷移先をタスク一覧に設定
  def after_sign_in_path_for(resource)
    tasks_path
  end

  # ログアウト後の遷移先をホームページ（トップページ）に設定
  def after_sign_out_path_for(resource_or_scope)
    root_path
  end
end
