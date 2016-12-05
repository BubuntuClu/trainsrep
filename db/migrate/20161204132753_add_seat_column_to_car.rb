class AddSeatColumnToCar < ActiveRecord::Migration[5.0]
  def change
    add_column :cars, :seat_space, :integer
  end
end
