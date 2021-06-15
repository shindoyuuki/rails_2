class AddColumnsToReservations < ActiveRecord::Migration[5.2]
  def change
    add_column :reservations, :price, :string
  end
end
