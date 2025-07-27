class AddUserIdToRooms < ActiveRecord::Migration[8.0]
  def change
    add_column :rooms, :user_id, :integer
  end
end
