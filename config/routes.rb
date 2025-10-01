Rails.application.routes.draw do
  # Home
  get 'home/index'

  # Devise用ルート
  devise_for :users

  # アプリケーションのルート
  root to: 'home#index'

  # リソースルート
  resources :tasks
  resources :users, only: [:index, :show, :edit, :update, :destroy] # 必要に応じてアクション追加

  # ユーザーごとのタスク表示・状態更新用
  resources :user_tasks, only: [:index, :update]
end
