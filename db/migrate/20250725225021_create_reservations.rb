class CreateReservations < ActiveRecord::Migration[8.0]
  def change
    create_table :reservations do |t|
      t.datetime :check_in
      t.datetime :checkout
      t.integer :person

      t.timestamps
    end
  end
end
