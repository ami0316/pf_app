class CreateBookings < ActiveRecord::Migration[6.1]
  def change
    create_table :bookings do |t|
      t.date :booking_date, null: false
      t.time :time, null: false
      t.integer :number_of_people, null: false
      t.boolean  :booking_status, default: false, null: false
      t.integer :room_id, null: false
      t.integer :customer_id, null: false


      t.timestamps
    end
  end
end
