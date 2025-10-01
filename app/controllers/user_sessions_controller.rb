# app/controllers/user_sessions_controller.rb
class UserSessionsController < ApplicationController
  # 新規登録（ログインページ）は認証不要
  skip_before_action :authenticate_user!, only: [:new, :create]

  # ログインページ
  def new
  end

  # ログイン処理
  def create
    @user = User.find_by(email: params[:email])
    if @user&.valid_password?(params[:password])
      sign_in(@user)
      redirect_to root_path, notice: 'Login successful'
    else
      flash.now[:alert] = 'Login failed'
      render :new
    end
  end

  # ログアウト処理
  def destroy
    sign_out(current_user)
    redirect_to root_path, notice: 'Logged out'
  end
end
