class AddColumnSortToTrain < ActiveRecord::Migration[5.0]
  def change
    add_column :trains, :ordering, :boolean
  end
end
