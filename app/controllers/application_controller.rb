class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: [:index]

  # ログイン後の遷移先をタスク一覧に設定
  def after_sign_in_path_for(resource)
    tasks_path
  end

  # ログアウト後の遷移先を環境ごとに設定
  def after_sign_out_path_for(resource_or_scope)
    if Rails.env.production?
      "https://graduation-project-v2-hyonnnn.onrender.com/"
    else
      root_path # 開発環境はローカルのトップページ
    end
  end
end
