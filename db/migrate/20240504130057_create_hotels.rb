class CreateHotels < ActiveRecord::Migration[6.1]
  def change
    create_table :hotels do |t|
      t.string :hotel_name, null: false
      t.text :body, null: false
      t.string :url, null: false
      t.string :telephone_number, null: false
      

      t.timestamps
    end
  end
end
