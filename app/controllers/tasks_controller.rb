class TasksController < ApplicationController
  before_action :authenticate_user!  # Deviseのログイン必須コールバック

  # 表示するタスクを固定で定義
  FIXED_TASKS = [
    { id: 1, title: "天気がいいのでお散歩気分", content: "外で軽く散歩する", status: "todo" },
    { id: 2, title: "家でスクワット", content: "自宅でスクワット20回×3セット", status: "todo" },
    { id: 3, title: "トイレ掃除でお家をきれいに", content: "トイレを掃除して清潔に保つ", status: "todo" },
    { id: 4, title: "カロリー消費を目指して階段上り下り", content: "階段の上り下りでカロリー消費", status: "todo" }
  ]

  def index
    # アプリ側で固定タスクを配列として渡す
    @tasks = FIXED_TASKS
  end

  def show
    # 選択したタスクを取得
    task_id = params[:id].to_i
    @task = FIXED_TASKS.find { |t| t[:id] == task_id }
    redirect_to tasks_path, alert: "タスクが見つかりません" unless @task
  end
end
