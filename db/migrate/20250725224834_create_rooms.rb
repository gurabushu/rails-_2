class CreateRooms < ActiveRecord::Migration[8.0]
  def change
    create_table :rooms do |t|
      t.string :img
      t.string :name
      t.integer :cash
      t.text :description
      t.datetime :create_day
      t.datetime :edit_day
      t.string :address

      t.timestamps
    end
  end
end
