class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.string :room_name, null: false
      t.text :room_datails, null: false
      t.integer :price, null: false
      t.boolean :availability, default: true, null: false

      t.timestamps
    end
  end
end
