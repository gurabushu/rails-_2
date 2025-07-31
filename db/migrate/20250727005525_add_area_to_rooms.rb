class AddAreaToRooms < ActiveRecord::Migration[8.0]
  def change
    add_column :rooms, :area, :string
  end
end
