class AddUserIdToRoom < ActiveRecord::Migration[5.0]
  def change
    add_column :rooms, :user_id, :string
  end
end
