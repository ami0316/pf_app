class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.string :room_name, null: false
      t.text :room_details, null: false
      t.integer :price, null: false
      t.boolean :availability, default: true, null: false
      t.integer :hotel_id, null: false
      t.date :booking_date, null: false

      t.timestamps
    end
  end
end
