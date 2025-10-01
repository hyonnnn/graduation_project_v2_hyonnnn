class UserSessionsController < ApplicationController
  # :require_login は存在しないので raise: false を付けるか、削除
  # skip_before_action :require_login, raise: false
  skip_before_action :authenticate_user!, only: [:new, :create]  # ログインページは認証不要

  def new; end

  def create
    @user = login(params[:email], params[:password])

    if @user
      redirect_to(root_path, notice: 'Login successful')
    else
      flash.now[:alert] = 'Login failed'
      render :new
    end
  end

  def destroy
    logout
    redirect_to(root_path, notice: 'Logged out')
  end
end
