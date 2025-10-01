Rails.application.routes.draw do
  # PositiveMessages 用ルート（UserTask ID を渡せる）
  resources :positive_messages, only: [:show]

  # Home
  get 'home/index'

  # Devise 用ルート
  devise_for :users

  # アプリケーションのルート
  root to: 'home#index'

  # リソースルート
  resources :tasks
  resources :users, only: [:index, :show, :edit, :update, :destroy]

  # ユーザーごとのタスク表示・状態更新用
  resources :user_tasks, only: [:index, :show, :update] do
    # ユーザーがタスクを選択するアクション
    post 'select', on: :collection
  end
end
