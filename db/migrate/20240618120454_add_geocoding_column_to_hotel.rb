class AddGeocodingColumnToHotel < ActiveRecord::Migration[6.1]
  def change
    add_column :hotels, :address, :string, null: false, default: ""
    add_column :hotels, :latitude, :float, null: false, default: 0
    add_column :hotels, :longitude, :float, null: false, default: 0
  end
end
