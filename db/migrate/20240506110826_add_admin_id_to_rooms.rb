class AddAdminIdToRooms < ActiveRecord::Migration[6.1]
  def change
    add_column :rooms, :admin_id, :integer
  end
end
