class CreateCars < ActiveRecord::Migration[5.0]
  def change
    create_table :cars do |t|
      t.string :car_type
      t.integer :up_space
      t.integer :low_space
      
      t.timestamps
    end
  end
end
