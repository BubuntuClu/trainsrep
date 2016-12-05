class AddColumnToCar < ActiveRecord::Migration[5.0]
  def change
    add_column :cars, :number, :integer
    add_column :cars, :side_up_space, :integer
    add_column :cars, :side_low_space, :integer
  end
end
