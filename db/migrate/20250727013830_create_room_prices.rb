class CreateRoomPrices < ActiveRecord::Migration[8.0]
  def change
    create_table :room_prices do |t|
      t.references :room, null: false, foreign_key: true
      t.date :date
      t.integer :price

      t.timestamps
    end
  end
end
