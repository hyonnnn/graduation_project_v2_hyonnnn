class UserTask < ApplicationRecord
  belongs_to :user
  belongs_to :task_template

  enum status: {
    not_started: 0,
    in_progress: 1,
    completed: 2,
  }
end
