class UserTasksController < ApplicationController
  before_action :authenticate_user!                  # ログイン必須
  before_action :set_user_task, only: [:show, :update]

  # タスク一覧画面
  def index
    # 全タスクを取得（TaskTemplate 使用）
    @task_templates = TaskTemplate.all
    # ユーザーがすでに選択した UserTask を取得
    @user_tasks = current_user.user_tasks.includes(:task_template)
    # ユーザーがすでに選択したタスクIDを取得
    @selected_task_ids = current_user.user_tasks.pluck(:task_template_id)
  end

  # ユーザーがタスクを選択 → UserTask 作成
  def select
    # params のキーを task_id に統一
    task_template = TaskTemplate.find(params[:task_id])

    # すでに選択済みか確認
    if current_user.user_tasks.exists?(task_template_id: task_template.id)
      redirect_to user_tasks_path, alert: "すでに選択済みのタスクです"
      return
    end

    # UserTask 作成
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

  # タスクのステータス更新
  def update
    if @user_task.update(user_task_params)
      redirect_to user_task_path(@user_task), notice: "タスクの状態を更新しました"
    else
      redirect_to user_task_path(@user_task), alert: "タスクの状態を更新できませんでした"
    end
  end

  private

  # ユーザーの UserTask を取得
  def set_user_task
    @user_task = current_user.user_tasks.find(params[:id])
  end

  # 更新可能なパラメータ
  def user_task_params
    params.require(:user_task).permit(:status)
  end
end
