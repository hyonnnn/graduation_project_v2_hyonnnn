class User < ApplicationRecord
  # Devise modules
  # 他に必要なモジュールがあれば追加できます
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable

  # アソシエーション
  has_many :tasks, dependent: :destroy

  # 独自メソッド
  def my_object?(object)
    object.user_id == id
  end
end
