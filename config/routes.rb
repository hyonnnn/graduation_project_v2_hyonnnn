Rails.application.routes.draw do
  # Devise用ルート
  devise_for :users

  # アプリケーションのルート
  root to: 'tasks#index'

  # リソースルート
  resources :tasks
  resources :users, only: [:index, :show, :edit, :update, :destroy] # 必要に応じてアクション追加
end
