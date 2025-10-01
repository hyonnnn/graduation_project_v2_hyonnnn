class CreateUserTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :user_tasks do |t|
      t.references :user, null: false, foreign_key: true
      t.references :task_template, null: false, foreign_key: true
      t.date :scheduled_date
      t.datetime :started_at
      t.datetime :completed_at
      t.integer :status

      t.timestamps
    end
  end
end
