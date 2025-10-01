# app/controllers/user_tasks_controller.rb
class UserTasksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user_task, only: [:show, :update]

  # タスク一覧（ユーザーが選択したタスクのステータス表示）
  def index
    @user_tasks = current_user.user_tasks.includes(:task_template)
  end

  # タスク選択 → UserTask 作成
  def select
    task_template = TaskTemplate.find_by(id: params[:task_id])
    unless task_template
      redirect_to user_tasks_path, alert: "タスクが見つかりません"
      return
    end

    if current_user.user_tasks.exists?(task_template_id: task_template.id)
      redirect_to user_tasks_path, alert: "すでに選択済みのタスクです"
      return
    end

    user_task = current_user.user_tasks.create!(
      task_template: task_template,
      scheduled_date: Date.today,
      status: :not_started
    )

    redirect_to user_task_path(user_task), notice: "#{task_template.name} を選択しました"
  end

  # タスク詳細画面（ステータス編集用）
  def show
    # @user_task は set_user_task でセット済み
  end

  # タスクステータス更新
  def update
    if @user_task.update(user_task_params)
      if @user_task.status == "completed"
        # 完了ならポジティブメッセージ画面に遷移
        redirect_to positive_message_path(@user_task.id)
      else
        redirect_to user_tasks_path, notice: "タスクの状態を更新しました"
      end
    else
      redirect_to user_tasks_path, alert: "タスクの状態を更新できませんでした"
    end
  end

  private

  def set_user_task
    @user_task = current_user.user_tasks.find_by(id: params[:id])
    redirect_to user_tasks_path, alert: "タスクが見つかりません" unless @user_task
  end

  def user_task_params
    params.require(:user_task).permit(:status)
  end
end
