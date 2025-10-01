# app/controllers/positive_messages_controller.rb
class PositiveMessagesController < ApplicationController
  before_action :authenticate_user!

  def show
    @user_task = current_user.user_tasks.find_by(id: params[:id])
    unless @user_task
      redirect_to user_tasks_path, alert: "タスクが見つかりません"
      return
    end

    # ランダムメッセージ
    @message = [
      "ママ、よく頑張ったね！",
      "ママ、すごいよ！",
      "ママ、だーいすき♡",
      "今日も笑顔で過ごそうね！"
    ].sample
  end
end
