class User < ApplicationRecord
  # Devise modules
  # 他に必要なモジュールがあれば追加できます
  devise :database_authenticatable, :validatable, :recoverable, :registerable

  # アソシエーション
  has_many :user_tasks
  has_many :task_templates, through: :user_tasks

  # 独自メソッド
  def my_object?(object)
    object.user_id == id
  end

  # メールアドレスの一意性バリデーション（エラーメッセージ変更）
  validates :email, uniqueness: { message: "は使用できません" }
end
