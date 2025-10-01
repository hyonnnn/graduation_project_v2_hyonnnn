class UsersController < ApplicationController
  # 新規登録ページ・作成処理はログイン不要
  skip_before_action :authenticate_user!, only: %i[new create]

  # 編集・更新・削除の前にユーザーをセット
  before_action :set_user, only: %i[show edit update destroy]
  
  # 編集・更新・削除は正しいユーザーかチェック
  before_action :forbid_invalid_access, only: %i[edit update destroy]

  # ユーザー一覧（ログイン必須）
  def index
    @users = User.all
  end

  # ユーザー詳細（ログイン必須）
  def show
  end

  # 新規ユーザー登録ページ
  def new
    @user = User.new
  end

  # ユーザー作成処理
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to new_user_session_path, notice: 'User was successfully created.'
    else
      render :new
    end
  end

  # ユーザー編集ページ
  def edit
  end

  # ユーザー更新処理
  def update
    if @user.update(user_params)
      redirect_to @user, notice: 'User was successfully updated.'
    else
      render :edit
    end
  end

  # ユーザー削除
  def destroy
    @user.destroy
    redirect_to users_path, notice: 'User was successfully deleted.'
  end

  private

  # 編集・更新・削除対象のユーザーをセット
  def set_user
    @user = User.find(params[:id])
  end

  # Strong Parameters
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

  # 自分以外のユーザーが編集・削除できないようにする
  def forbid_invalid_access
    return if @user == current_user

    redirect_to current_user, alert: 'Forbidden access.'
  end
end
