# db/migrate/20250930054231_add_devise_to_users.rb
class AddDeviseToUsers < ActiveRecord::Migration[7.0]
  def change
    ## Database authenticatable
    # add_column :users, :email, :string, null: false, default: "" # 既存なので不要
    add_column :users, :encrypted_password, :string, null: false, default: ""

    ## Recoverable
    add_column :users, :reset_password_token, :string
    add_column :users, :reset_password_sent_at, :datetime

    ## Rememberable
    add_column :users, :remember_created_at, :datetime

    add_index :users, :reset_password_token, unique: true
    # email はすでに index されている場合は不要
  end
end
