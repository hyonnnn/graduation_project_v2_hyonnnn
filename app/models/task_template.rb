# app/models/task_template.rb
class TaskTemplate < ApplicationRecord
  # アソシエーション
  has_many :user_tasks
  has_many :users, through: :user_tasks
end
