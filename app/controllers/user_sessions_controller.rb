class UsersController < ApplicationController
  # 新規登録は認証不要
  skip_before_action :authenticate_user!, only: [:new, :create]

  # ユーザー一覧（ログイン必須）
  def index
    @users = User.all
  end

  # ユーザー詳細（ログイン必須）
  def show
    @user = User.find(params[:id])
  end

  # 新規ユーザー登録ページ
  def new
    @user = User.new
  end

  # ユーザー作成処理
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path, notice: 'User created successfully'
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
