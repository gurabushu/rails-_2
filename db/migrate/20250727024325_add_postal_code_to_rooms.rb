class AddPostalCodeToRooms < ActiveRecord::Migration[8.0]
  def change
    add_column :rooms, :postal_code, :string
  end
end
