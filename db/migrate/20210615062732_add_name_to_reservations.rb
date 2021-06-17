class AddNameToReservations < ActiveRecord::Migration[5.2]
  def change
    add_column :reservations, :room_id, :string
  end
end
