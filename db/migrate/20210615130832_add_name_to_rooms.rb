class AddNameToRooms < ActiveRecord::Migration[5.2]
  def change
    add_column :rooms, :user_id, :string
  end
end
