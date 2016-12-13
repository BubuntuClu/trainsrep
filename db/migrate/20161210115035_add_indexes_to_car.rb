class AddIndexesToCar < ActiveRecord::Migration[5.0]
  def change
    add_index :cars, [:id, :car_type]
  end
end
